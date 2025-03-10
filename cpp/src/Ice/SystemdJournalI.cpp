// Copyright (c) ZeroC, Inc.

#ifdef ICE_USE_SYSTEMD

#    include "SystemdJournalI.h"
#    include "Ice/LocalExceptions.h"
#    include <syslog.h>
#    include <systemd/sd-journal.h>

using namespace std;
using namespace Ice;
using namespace IceInternal;

Ice::SystemdJournalI::SystemdJournalI(string prefix) : _prefix(std::move(prefix)) {}

void
Ice::SystemdJournalI::print(const string& message)
{
    write(LOG_INFO, message);
}

void
Ice::SystemdJournalI::trace(const string& category, const string& message)
{
    write(LOG_INFO, category + ": " + message);
}

void
Ice::SystemdJournalI::warning(const string& message)
{
    write(LOG_WARNING, message);
}

void
Ice::SystemdJournalI::error(const string& message)
{
    write(LOG_ERR, message);
}

string
Ice::SystemdJournalI::getPrefix()
{
    return _prefix;
}

Ice::LoggerPtr
Ice::SystemdJournalI::cloneWithPrefix(string prefix)
{
    return make_shared<SystemdJournalI>(std::move(prefix));
}

void
Ice::SystemdJournalI::write(int priority, const string& message) const
{
    sd_journal_send(
        "MESSAGE=%s",
        message.c_str(),
        "PRIORITY=%i",
        priority,
        "SYSLOG_IDENTIFIER=%s",
        _prefix.c_str(),
        NULL); // Using NULL is necessary for EL7, see #293
}

#endif
