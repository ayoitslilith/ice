// Copyright (c) ZeroC, Inc.

#include "Ice/Ice.h"
#include "Ice/IconvStringConverter.h"
#include "TestHelper.h"

#ifdef _WIN32
#    include <windows.h>
#endif

using namespace std;

class Client2 : public Test::TestHelper
{
public:
    void run(int, char**) override;
};

void
Client2::run(int argc, char** argv)
{
#ifdef _WIN32
    int cp = GetConsoleOutputCP();
    //
    // 28605 == ISO 8859-15 codepage
    //
    SetConsoleOutputCP(28605);
    setProcessStringConverter(Ice::createWindowsStringConverter(1250));
#else
    setProcessStringConverter(Ice::createIconvStringConverter<char>("ISO8859-15"));
#endif

    Ice::PropertiesPtr properties = createTestProperties(argc, argv);
    properties->load("config.client");

    Ice::CommunicatorHolder communicator = initialize(argc, argv, properties);
    communicator->getLogger()->trace("info", "XXX");

#ifdef _WIN32
    SetConsoleOutputCP(cp);
#endif
}

DEFINE_TEST(Client2)
