// Copyright (c) ZeroC, Inc.

package test.Ice.networkProxy;

import test.Ice.networkProxy.Test.TestIntfPrx;

import java.io.PrintWriter;

public class AllTests {
    private static void test(boolean b) {
        if (!b) {
            throw new RuntimeException();
        }
    }

    public static void allTests(test.TestHelper helper) {
        com.zeroc.Ice.Communicator communicator = helper.communicator();
        PrintWriter out = helper.getWriter();

        String sref = "test:" + helper.getTestEndpoint(0);
        com.zeroc.Ice.ObjectPrx obj = communicator.stringToProxy(sref);
        test(obj != null);

        int proxyPort = communicator.getProperties().getIcePropertyAsInt("Ice.HTTPProxyPort");
        // default, i.e. most likely not set
        if (proxyPort == 1080) {
            proxyPort = communicator.getProperties().getIcePropertyAsInt("Ice.SOCKSProxyPort");
        }

        TestIntfPrx test = TestIntfPrx.checkedCast(obj);
        test(test != null);

        out.print("testing connection... ");
        out.flush();
        {
            test.ice_ping();
        }
        out.println("ok");

        out.print("testing connection information... ");
        out.flush();
        {
            com.zeroc.Ice.IPConnectionInfo info = null;
            for (com.zeroc.Ice.ConnectionInfo p = test.ice_getConnection().getInfo();
                    p != null;
                    p = p.underlying) {
                if (p instanceof com.zeroc.Ice.IPConnectionInfo) {
                    info = (com.zeroc.Ice.IPConnectionInfo) p;
                }
            }
            test(info.remotePort == proxyPort); // make sure we are connected to the proxy port.
        }
        out.println("ok");

        out.print("shutting down server... ");
        out.flush();
        {
            test.shutdown();
        }
        out.println("ok");

        out.print("testing connection failure... ");
        out.flush();
        {
            try {
                test.ice_ping();
                test(false);
            } catch (com.zeroc.Ice.LocalException ex) {
            }
        }
        out.println("ok");
    }

    private AllTests() {
    }
}
