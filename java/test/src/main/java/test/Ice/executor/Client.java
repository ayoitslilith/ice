// Copyright (c) ZeroC, Inc.

package test.Ice.executor;

import com.zeroc.Ice.Communicator;
import com.zeroc.Ice.InitializationData;

import test.TestHelper;

public class Client extends TestHelper {
    public void run(String[] args) {
        InitializationData initData = new InitializationData();
        initData.properties = createTestProperties(args);
        initData.properties.setProperty("Ice.Package.Test", "test.Ice.executor");

        CustomExecutor executor = new CustomExecutor();
        //
        // Limit the send buffer size, this test relies on the socket
        // send() blocking after sending a given amount of data.
        //
        initData.properties.setProperty("Ice.TCP.SndSize", "50000");

        initData.executor = executor;
        try (Communicator communicator = initialize(initData)) {
            AllTests.allTests(this, executor);
        }
        executor.terminate();
    }
}
