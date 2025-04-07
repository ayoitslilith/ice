// Copyright (c) ZeroC, Inc.

package test.Ice.optional;

import com.zeroc.Ice.Communicator;
import com.zeroc.Ice.Properties;

import test.Ice.optional.Test.InitialPrx;
import test.TestHelper;

public class Client extends TestHelper {
    public void run(String[] args) {
        Properties properties = createTestProperties(args);
        properties.setProperty("Ice.Package.Test", "test.Ice.optional");
        try (Communicator communicator = initialize(properties)) {
            InitialPrx initial = AllTests.allTests(this, false);
            initial.shutdown();
        }
    }
}
