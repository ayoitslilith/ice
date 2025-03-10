// Copyright (c) ZeroC, Inc.

#include "AdminSessionI.h"
#include "../Ice/SSL/SSLUtil.h"
#include "AdminI.h"
#include "Database.h"
#include "Ice/Ice.h"
#include "RegistryI.h"
#include "SynchronizationException.h"

using namespace std;
using namespace IceGrid;

namespace
{
    class SubscriberForwarderI : public Ice::BlobjectArrayAsync
    {
    public:
        SubscriberForwarderI(Ice::ObjectPrx proxy) : _proxy(std::move(proxy)) {}

        void ice_invokeAsync(
            pair<const byte*, const byte*> inParams,
            function<void(bool, pair<const byte*, const byte*>)> response,
            function<void(exception_ptr)> exception,
            const Ice::Current& current) override
        {
            _proxy->ice_invokeAsync(
                current.operation,
                current.mode,
                inParams,
                std::move(response),
                [exception = std::move(exception)](exception_ptr)
                {
                    // Throw ObjectNotExistException, the subscriber is unreachable
                    exception(make_exception_ptr(Ice::ObjectNotExistException{__FILE__, __LINE__}));
                },
                nullptr,
                current.ctx);
        }

    private:
        const Ice::ObjectPrx _proxy;
    };
}

FileIteratorI::FileIteratorI(
    shared_ptr<AdminSessionI> session,
    FileReaderPrx reader,
    string filename,
    int64_t offset,
    int messageSizeMax)
    : _session(std::move(session)),
      _reader(std::move(reader)),
      _filename(std::move(filename)),
      _offset(offset),
      _messageSizeMax(messageSizeMax - 256) // Room for the header
{
}

bool
FileIteratorI::read(int size, Ice::StringSeq& lines, const Ice::Current&)
{
    try
    {
        return _reader->read(_filename, _offset, size > _messageSizeMax ? _messageSizeMax : size, _offset, lines);
    }
    catch (const std::exception& ex)
    {
        throw FileNotAvailableException(ex.what());
    }
}

void
FileIteratorI::destroy(const Ice::Current& current)
{
    _session->removeFileIterator(current.id, current);
}

AdminSessionI::AdminSessionI(const string& id, const shared_ptr<Database>& db, const shared_ptr<RegistryI>& registry)
    : BaseSessionI(id, "admin", db),
      _replicaName(registry->getName()),
      _registry(registry)
{
}

Ice::ObjectPrx
AdminSessionI::_register(
    const shared_ptr<SessionServantManager>& servantManager,
    const shared_ptr<Ice::Connection>& con)
{
    //
    // This is supposed to be called after creation only, no need to synchronize.
    //
    _servantManager = servantManager;

    string category;

    if (con)
    {
        category = _database->getInstanceName() + "-" + Ice::generateUUID();

        Ice::Identity templateId;
        templateId.name = "pick-a-name";
        templateId.category = category;

        _adminCallbackTemplate = _registry->createAdminCallbackProxy(templateId);
    }

    auto self = shared_from_this();

    Ice::ObjectPrx session = _servantManager->addSession(self, con, category);

    _admin = Ice::uncheckedCast<AdminPrx>(_servantManager->add(
        make_shared<AdminI>(_database, _registry, static_pointer_cast<AdminSessionI>(self)),
        self));

    return session;
}

optional<AdminPrx>
AdminSessionI::getAdmin(const Ice::Current&) const
{
    return _admin;
}

std::optional<Ice::ObjectPrx>
AdminSessionI::getAdminCallbackTemplate(const Ice::Current&) const
{
    return _adminCallbackTemplate;
}

void
AdminSessionI::setObservers(
    optional<RegistryObserverPrx> registryObserver,
    optional<NodeObserverPrx> nodeObserver,
    optional<ApplicationObserverPrx> appObserver,
    optional<AdapterObserverPrx> adapterObserver,
    optional<ObjectObserverPrx> objectObserver,
    const Ice::Current&)
{
    lock_guard lock(_mutex);

    if (_destroyed)
    {
        throw Ice::ObjectNotExistException{__FILE__, __LINE__};
    }

    const auto locator = _registry->getLocator();
    if (registryObserver)
    {
        setupObserverSubscription(TopicName::RegistryObserver, addForwarder(registryObserver->ice_locator(locator)));
    }
    else
    {
        setupObserverSubscription(TopicName::RegistryObserver, nullopt);
    }

    if (nodeObserver)
    {
        setupObserverSubscription(TopicName::NodeObserver, addForwarder(nodeObserver->ice_locator(locator)));
    }
    else
    {
        setupObserverSubscription(TopicName::NodeObserver, nullopt);
    }

    if (appObserver)
    {
        setupObserverSubscription(TopicName::ApplicationObserver, addForwarder(appObserver->ice_locator(locator)));
    }
    else
    {
        setupObserverSubscription(TopicName::ApplicationObserver, nullopt);
    }

    if (adapterObserver)
    {
        setupObserverSubscription(TopicName::AdapterObserver, addForwarder(adapterObserver->ice_locator(locator)));
    }
    else
    {
        setupObserverSubscription(TopicName::AdapterObserver, nullopt);
    }

    if (objectObserver)
    {
        setupObserverSubscription(TopicName::ObjectObserver, addForwarder(objectObserver->ice_locator(locator)));
    }
    else
    {
        setupObserverSubscription(TopicName::ObjectObserver, nullopt);
    }
}

void
AdminSessionI::setObserversByIdentity(
    Ice::Identity registryObserver,
    Ice::Identity nodeObserver,
    Ice::Identity appObserver,
    Ice::Identity adapterObserver,
    Ice::Identity objectObserver,
    const Ice::Current& current)
{
    lock_guard lock(_mutex);

    if (_destroyed)
    {
        throw Ice::ObjectNotExistException{__FILE__, __LINE__};
    }

    setupObserverSubscription(TopicName::RegistryObserver, addForwarder(registryObserver, current), true);
    setupObserverSubscription(TopicName::NodeObserver, addForwarder(nodeObserver, current), true);
    setupObserverSubscription(TopicName::ApplicationObserver, addForwarder(appObserver, current), true);
    setupObserverSubscription(TopicName::AdapterObserver, addForwarder(adapterObserver, current), true);
    setupObserverSubscription(TopicName::ObjectObserver, addForwarder(objectObserver, current), true);
}

int
AdminSessionI::startUpdate(const Ice::Current&)
{
    lock_guard lock(_mutex);

    if (_destroyed)
    {
        throw Ice::ObjectNotExistException{__FILE__, __LINE__};
    }

    int serial = _database->lock(this, _id);
    return serial;
}

void
AdminSessionI::finishUpdate(const Ice::Current&)
{
    lock_guard lock(_mutex);

    if (_destroyed)
    {
        throw Ice::ObjectNotExistException{__FILE__, __LINE__};
    }

    _database->unlock(this);
}

string
AdminSessionI::getReplicaName(const Ice::Current&) const
{
    return _replicaName;
}

optional<FileIteratorPrx>
AdminSessionI::openServerLog(string id, string path, int nLines, const Ice::Current& current)
{
    try
    {
        return addFileIterator(_database->getServer(id)->getProxy(false, 5s), "#" + path, nLines, current);
    }
    catch (const SynchronizationException&)
    {
        throw DeploymentException("server is being updated");
    }
}

optional<FileIteratorPrx>
AdminSessionI::openServerStdOut(string id, int nLines, const Ice::Current& current)
{
    try
    {
        return addFileIterator(_database->getServer(id)->getProxy(false, 5s), "stdout", nLines, current);
    }
    catch (const SynchronizationException&)
    {
        throw DeploymentException("server is being updated");
    }
}

optional<FileIteratorPrx>
AdminSessionI::openServerStdErr(string id, int nLines, const Ice::Current& current)
{
    try
    {
        return addFileIterator(_database->getServer(id)->getProxy(false, 5s), "stderr", nLines, current);
    }
    catch (const SynchronizationException&)
    {
        throw DeploymentException("server is being updated");
    }
}

optional<FileIteratorPrx>
AdminSessionI::openNodeStdOut(string name, int nLines, const Ice::Current& current)
{
    return addFileIterator(_database->getNode(name)->getProxy(), "stdout", nLines, current);
}

optional<FileIteratorPrx>
AdminSessionI::openNodeStdErr(string name, int nLines, const Ice::Current& current)
{
    return addFileIterator(_database->getNode(name)->getProxy(), "stderr", nLines, current);
}

optional<FileIteratorPrx>
AdminSessionI::openRegistryStdOut(string name, int nLines, const Ice::Current& current)
{
    return addFileIterator(
        name == _replicaName ? _database->getReplicaCache().getInternalRegistry()
                             : _database->getReplica(name)->getProxy(),
        "stdout",
        nLines,
        current);
}

optional<FileIteratorPrx>
AdminSessionI::openRegistryStdErr(string name, int nLines, const Ice::Current& current)
{
    return addFileIterator(
        name == _replicaName ? _database->getReplicaCache().getInternalRegistry()
                             : _database->getReplica(name)->getProxy(),
        "stderr",
        nLines,
        current);
}

void
AdminSessionI::destroy(const Ice::Current&)
{
    destroyImpl(false);
}

void
AdminSessionI::setupObserverSubscription(TopicName name, const optional<Ice::ObjectPrx>& observer, bool forwarder)
{
    auto p = _observers.find(name);
    if (p != _observers.end() && p->second.first != observer)
    {
        Ice::ObjectPrx previousObserver = p->second.first;
        _database->getObserverTopic(name)->unsubscribe(previousObserver);
        if (p->second.second)
        {
            try
            {
                // Unregister forwarder object
                _registry->getRegistryAdapter()->remove(previousObserver->ice_getIdentity());
            }
            catch (const Ice::ObjectAdapterDestroyedException&)
            {
            }
        }
        _observers.erase(name);
    }

    if (observer)
    {
        _observers.insert({name, {*observer, forwarder}});
        _database->getObserverTopic(name)->subscribe(*observer);
    }
}

optional<Ice::ObjectPrx>
AdminSessionI::addForwarder(const Ice::Identity& id, const Ice::Current& current)
{
    if (id.name.empty())
    {
        return nullopt;
    }
    return addForwarder(current.con->createProxy(id)->ice_encodingVersion(current.encoding));
}

Ice::ObjectPrx
AdminSessionI::addForwarder(Ice::ObjectPrx prx)
{
    return _registry->getRegistryAdapter()->addWithUUID(make_shared<SubscriberForwarderI>(std::move(prx)));
}

FileIteratorPrx
AdminSessionI::addFileIterator(FileReaderPrx reader, const string& filename, int nLines, const Ice::Current&)
{
    lock_guard lock(_mutex);

    if (_destroyed)
    {
        throw Ice::ObjectNotExistException{__FILE__, __LINE__};
    }

    // Always call getOffsetFromEnd even if nLines < 0. This allows to throw right away if the file doesn't exit.
    int64_t offset;
    try
    {
        offset = reader->getOffsetFromEnd(filename, nLines);
    }
    catch (const std::exception& ex)
    {
        throw FileNotAvailableException(ex.what());
    }

    auto properties = reader->ice_getCommunicator()->getProperties();
    int messageSizeMax = properties->getIcePropertyAsInt("Ice.MessageSizeMax") * 1024;

    auto self = static_pointer_cast<AdminSessionI>(shared_from_this());
    return Ice::uncheckedCast<FileIteratorPrx>(_servantManager->add(
        make_shared<FileIteratorI>(self, std::move(reader), filename, offset, messageSizeMax),
        self));
}

void
AdminSessionI::removeFileIterator(const Ice::Identity& id, const Ice::Current&)
{
    lock_guard lock(_mutex);

    _servantManager->remove(id);
}

void
AdminSessionI::destroyImpl(bool shutdown)
{
    BaseSessionI::destroyImpl(shutdown);

    _servantManager->removeSession(shared_from_this());

    try
    {
        _database->unlock(this);
    }
    catch (const AccessDeniedException&)
    {
    }

    if (!shutdown)
    {
        //
        // Unsubscribe from the topics.
        //
        setupObserverSubscription(TopicName::RegistryObserver, nullopt);
        setupObserverSubscription(TopicName::NodeObserver, nullopt);
        setupObserverSubscription(TopicName::ApplicationObserver, nullopt);
        setupObserverSubscription(TopicName::AdapterObserver, nullopt);
        setupObserverSubscription(TopicName::ObjectObserver, nullopt);
    }
}

AdminSessionFactory::AdminSessionFactory(
    const shared_ptr<SessionServantManager>& servantManager,
    const shared_ptr<Database>& database,
    const shared_ptr<ReapThread>& reaper,
    const shared_ptr<RegistryI>& registry)
    : _servantManager(servantManager),
      _database(database),
      _reaper(reaper),
      _registry(registry)
{
    if (_servantManager) // Not set if Glacier2 session manager adapter not enabled
    {
        auto props = database->getCommunicator()->getProperties();
        const_cast<bool&>(_filters) = props->getIcePropertyAsInt("IceGrid.Registry.AdminSessionFilters") > 0;
    }
}

Glacier2::SessionPrx
AdminSessionFactory::createGlacier2Session(
    const string& sessionId,
    const optional<Glacier2::SessionControlPrx>& ctl,
    const Ice::ConnectionPtr& con)
{
    assert(_servantManager);

    auto session = createSessionServant(sessionId);
    auto proxy = session->_register(_servantManager, con);

    if (ctl)
    {
        try
        {
            if (_filters)
            {
                _servantManager->setSessionControl(session, *ctl, {{"Query", _database->getInstanceName()}});
            }
        }
        catch (const Ice::LocalException& e)
        {
            session->destroy(Ice::Current());

            Ice::Warning out(_database->getTraceLevels()->logger);
            out << "Failed to callback Glacier2 session control object:\n" << e;

            throw Glacier2::CannotCreateSessionException("internal server error");
        }
    }

    // We can't use a non-0 timeout such as the Glacier2 session timeout. As of Ice 3.8, heartbeats may not be sent
    // at all on a busy connection. Furthermore, as of Ice 3.8, Glacier2 no longer "converts" heartbeats into
    // keepAlive requests.
    _reaper->add(make_shared<SessionReapable<AdminSessionI>>(_database->getTraceLevels()->logger, session), 0s, con);
    return Ice::uncheckedCast<Glacier2::SessionPrx>(proxy);
}

shared_ptr<AdminSessionI>
AdminSessionFactory::createSessionServant(const string& id)
{
    return make_shared<AdminSessionI>(id, _database, _registry);
}

const shared_ptr<TraceLevels>&
AdminSessionFactory::getTraceLevels() const
{
    return _database->getTraceLevels();
}

AdminSessionManagerI::AdminSessionManagerI(const shared_ptr<AdminSessionFactory>& factory) : _factory(factory) {}

optional<Glacier2::SessionPrx>
AdminSessionManagerI::create(string userId, optional<Glacier2::SessionControlPrx> ctl, const Ice::Current& current)
{
    return _factory->createGlacier2Session(userId, ctl, current.con);
}

AdminSSLSessionManagerI::AdminSSLSessionManagerI(const shared_ptr<AdminSessionFactory>& factory) : _factory(factory) {}

optional<Glacier2::SessionPrx>
AdminSSLSessionManagerI::create(
    Glacier2::SSLInfo info,
    optional<Glacier2::SessionControlPrx> ctl,
    const Ice::Current& current)
{
    string userDN;
    if (!info.certs.empty()) // TODO: Require userDN?
    {
        try
        {
            Ice::SSL::ScopedCertificate cert = Ice::SSL::decodeCertificate(info.certs[0]);
            userDN = Ice::SSL::getSubjectName(cert.get());
        }
        catch (const Ice::Exception& ex)
        {
            // This shouldn't happen, the SSLInfo is supposed to be encoded by Glacier2.
            Ice::Error out(_factory->getTraceLevels()->logger);
            out << "SSL session manager couldn't decode SSL certificates:\n" << ex;
            throw Glacier2::CannotCreateSessionException("internal server error");
        }
    }

    return _factory->createGlacier2Session(userDN, ctl, current.con);
}
