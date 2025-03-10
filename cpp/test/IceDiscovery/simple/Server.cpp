// Copyright (c) ZeroC, Inc.

#include "Ice/Ice.h"
#include "TestHelper.h"
#include "TestI.h"

using namespace std;

class Server : public Test::TestHelper
{
public:
    void run(int, char**) override;
};

void
Server::run(int argc, char** argv)
{
#ifdef ICE_STATIC_LIBS
    Ice::registerIceDiscovery();
#endif

    Ice::CommunicatorHolder communicator = initialize(argc, argv);
    Ice::PropertiesPtr properties = communicator->getProperties();

    int num = argc == 2 ? stoi(argv[1]) : 0;

    properties->setProperty("ControlAdapter.Endpoints", getTestEndpoint(num));

    {
        ostringstream os;
        os << "control" << num;
        properties->setProperty("ControlAdapter.AdapterId", os.str());
    }
    properties->setProperty("ControlAdapter.ThreadPool.Size", "1");
    Ice::ObjectAdapterPtr adapter = communicator->createObjectAdapter("ControlAdapter");
    {
        ostringstream os;
        os << "controller" << num;
        adapter->add(std::make_shared<ControllerI>(), Ice::stringToIdentity(os.str()));
    }
    adapter->activate();

    serverReady();

    communicator->waitForShutdown();
}

DEFINE_TEST(Server)
