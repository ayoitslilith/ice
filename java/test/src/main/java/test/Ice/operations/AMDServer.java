// Copyright (c) ZeroC, Inc.

package test.Ice.operations;

import com.zeroc.Ice.Communicator;
import com.zeroc.Ice.ObjectAdapter;
import com.zeroc.Ice.Properties;
import com.zeroc.Ice.Util;

import test.TestHelper;

public class AMDServer extends TestHelper {
    public void run(String[] args) {
        Properties properties = createTestProperties(args);
        //
        // It's possible to have batch oneway requests dispatched
        // after the adapter is deactivated due to thread
        // scheduling so we suppress this warning.
        //
        properties.setProperty("Ice.Warn.Dispatch", "0");
        properties.setProperty("Ice.Package.Test", "test.Ice.operations.AMD");
        try (Communicator communicator = initialize(properties)) {
            communicator.getProperties().setProperty("TestAdapter.Endpoints", getTestEndpoint(0));
            ObjectAdapter adapter = communicator.createObjectAdapter("TestAdapter");
            adapter.add(new AMDMyDerivedClassI(), Util.stringToIdentity("test"));
            adapter.activate();
            serverReady();
            communicator.waitForShutdown();
        }
    }
}
