// Copyright (c) ZeroC, Inc.

using Test;

namespace Ice.inheritance;

public class Server : TestHelper
{
    public override void run(string[] args)
    {
        using var communicator = initialize(ref args);
        communicator.getProperties().setProperty("TestAdapter.Endpoints", getTestEndpoint(0));
        Ice.ObjectAdapter adapter = communicator.createObjectAdapter("TestAdapter");
        Ice.Object @object = new InitialI(adapter);
        adapter.add(@object, Ice.Util.stringToIdentity("initial"));
        adapter.activate();
        serverReady();
        communicator.waitForShutdown();
    }

    public static Task<int> Main(string[] args) =>
        TestDriver.runTestAsync<Server>(args);
}
