// Copyright (c) ZeroC, Inc.

package test.Ice.objects;

import test.Ice.objects.Test.InitialPrx;

public class Client extends test.TestHelper {
    private static class MyValueFactory implements com.zeroc.Ice.ValueFactory {
        @Override
        public com.zeroc.Ice.Value create(String type) {
            if ("::Test::B".equals(type)) {
                return new BI();
            } else if ("::Test::C".equals(type)) {
                return new CI();
            } else if ("::Test::D".equals(type)) {
                return new DI();
            }
            assert false; // Should never be reached
            return null;
        }
    }

    public void run(String[] args) {
        com.zeroc.Ice.Properties properties = createTestProperties(args);
        properties.setProperty("Ice.Package.Test", "test.Ice.objects");
        properties.setProperty("Ice.MessageSizeMax", "2048"); // Needed on some Android versions
        try (com.zeroc.Ice.Communicator communicator = initialize(properties)) {
            com.zeroc.Ice.ValueFactory factory = new MyValueFactory();
            communicator.getValueFactoryManager().add(factory, "::Test::B");
            communicator.getValueFactoryManager().add(factory, "::Test::C");
            communicator.getValueFactoryManager().add(factory, "::Test::D");

            InitialPrx initial = AllTests.allTests(this);
            initial.shutdown();
        }
    }
}
