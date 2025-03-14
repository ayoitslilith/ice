// Copyright (c) ZeroC, Inc.

package test.Ice.slicing.exceptions;

public class Server extends test.TestHelper {
    public void run(String[] args) {
        com.zeroc.Ice.Properties properties = createTestProperties(args);
        properties.setProperty("Ice.Package.Test", "test.Ice.slicing.exceptions.server");
        properties.setProperty("Ice.Warn.Dispatch", "0");
        try (com.zeroc.Ice.Communicator communicator = initialize(properties)) {
            communicator
                    .getProperties()
                    .setProperty("TestAdapter.Endpoints", getTestEndpoint(0) + " -t 2000");
            com.zeroc.Ice.ObjectAdapter adapter = communicator.createObjectAdapter("TestAdapter");
            adapter.add(new TestI(), com.zeroc.Ice.Util.stringToIdentity("Test"));
            adapter.activate();
            serverReady();
            communicator.waitForShutdown();
        }
    }
}
