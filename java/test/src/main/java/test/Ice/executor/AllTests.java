// Copyright (c) ZeroC, Inc.

package test.Ice.executor;

import com.zeroc.Ice.Communicator;
import com.zeroc.Ice.CommunicatorDestroyedException;
import com.zeroc.Ice.InvocationFuture;
import com.zeroc.Ice.InvocationTimeoutException;
import com.zeroc.Ice.NoEndpointException;
import com.zeroc.Ice.ObjectPrx;
import com.zeroc.Ice.Util;

import test.Ice.executor.Test.TestIntfControllerPrx;
import test.Ice.executor.Test.TestIntfPrx;
import test.TestHelper;

import java.io.PrintWriter;
import java.util.Random;
import java.util.concurrent.CompletableFuture;

public class AllTests {
    private static class Callback {
        Callback() {
            _called = false;
            _exception = null;
        }

        public synchronized void check() {
            while (!_called) {
                try {
                    wait();
                } catch (InterruptedException ex) {}
            }
            if (_exception != null) {
                throw _exception;
            }
            _called = false;
        }

        public synchronized void exception(Throwable ex) {
            assert (!_called);
            _called = true;
            if (ex instanceof RuntimeException) {
                _exception = (RuntimeException) ex;
            } else {
                _exception = new RuntimeException(ex);
            }
            notify();
        }

        public synchronized void called() {
            assert (!_called);
            _called = true;
            notify();
        }

        private boolean _called;
        private RuntimeException _exception;
    }

    private static void test(boolean b) {
        if (!b) {
            throw new RuntimeException();
        }
    }

    public static void allTests(TestHelper helper, final CustomExecutor executor) {
        Communicator communicator = helper.communicator();
        PrintWriter out = helper.getWriter();

        String sref = "test:" + helper.getTestEndpoint(0);
        ObjectPrx obj = communicator.stringToProxy(sref);
        test(obj != null);

        int mult = 1;
        if (!"tcp".equals(communicator.getProperties().getIceProperty("Ice.Default.Protocol"))
            || helper.isAndroid()) {
            mult = 4;
        }

        TestIntfPrx p = TestIntfPrx.uncheckedCast(obj);

        sref = "testController:" + helper.getTestEndpoint(1, "tcp");
        obj = communicator.stringToProxy(sref);
        test(obj != null);

        TestIntfControllerPrx testController = TestIntfControllerPrx.uncheckedCast(obj);

        out.print("testing executor... ");
        out.flush();
        {
            p.op();

            {
                final Callback cb = new Callback();
                p.opAsync()
                    .whenCompleteAsync(
                        (result, ex) -> {
                            if (ex != null) {
                                cb.exception(ex);
                            } else {
                                test(executor.isCustomExecutorThread());
                                cb.called();
                            }
                        },
                        executor);
                cb.check();
            }

            {
                final Callback cb = new Callback();
                p.opAsync()
                    .whenCompleteAsync(
                        (result, ex) -> {
                            if (ex != null) {
                                cb.exception(ex);
                            } else {
                                test(executor.isCustomExecutorThread());
                                cb.called();
                            }
                        },
                        p.ice_executor());
                cb.check();
            }

            {
                TestIntfPrx i = p.ice_adapterId("dummy");
                final Callback cb = new Callback();
                i.opAsync()
                    .whenCompleteAsync(
                        (result, ex) -> {
                            if (ex != null) {
                                test(ex instanceof NoEndpointException);
                                test(executor.isCustomExecutorThread());
                                cb.called();
                            } else {
                                cb.exception(new RuntimeException());
                            }
                        },
                        executor);
                cb.check();
            }

            {
                TestIntfPrx i = p.ice_adapterId("dummy");
                final Callback cb = new Callback();
                i.opAsync()
                    .whenCompleteAsync(
                        (result, ex) -> {
                            if (ex != null) {
                                test(ex instanceof NoEndpointException);
                                test(executor.isCustomExecutorThread());
                                cb.called();
                            } else {
                                cb.exception(new RuntimeException());
                            }
                        },
                        p.ice_executor());
                cb.check();
            }

            {
                //
                // Expect InvocationTimeoutException.
                //
                TestIntfPrx to = p.ice_invocationTimeout(10);
                final Callback cb = new Callback();
                CompletableFuture<Void> r = to.sleepAsync(500 * mult);
                r.whenCompleteAsync(
                    (result, ex) -> {
                        if (ex != null) {
                            test(ex instanceof InvocationTimeoutException);
                            test(executor.isCustomExecutorThread());
                            cb.called();
                        } else {
                            cb.exception(new RuntimeException());
                        }
                    },
                    executor);
                Util.getInvocationFuture(r)
                    .whenSentAsync(
                        (sentSynchronously, ex) -> {
                            test(ex == null);
                            test(executor.isCustomExecutorThread());
                        },
                        executor);
                cb.check();
            }

            {
                //
                // Expect InvocationTimeoutException.
                //
                TestIntfPrx to = p.ice_invocationTimeout(10);
                final Callback cb = new Callback();
                CompletableFuture<Void> r = to.sleepAsync(500 * mult);
                r.whenCompleteAsync(
                    (result, ex) -> {
                        if (ex != null) {
                            test(ex instanceof InvocationTimeoutException);
                            test(executor.isCustomExecutorThread());
                            cb.called();
                        } else {
                            cb.exception(new RuntimeException());
                        }
                    },
                    executor);
                Util.getInvocationFuture(r)
                    .whenSentAsync(
                        (sentSynchronously, ex) -> {
                            test(ex == null);
                            test(executor.isCustomExecutorThread());
                        },
                        p.ice_executor());
                cb.check();
            }

            // Hold adapter to make sure the invocations don't complete synchronously. Also disable
            // collocation optimization on p.
            //
            testController.holdAdapter();
            p = p.ice_collocationOptimized(false);
            byte[] seq = new byte[10 * 1024];
            new Random()
                .nextBytes(seq); // Make sure the request doesn't compress too well.
            CompletableFuture<Void> r = null;
            while (true) {
                r = p.opWithPayloadAsync(seq);
                r.whenComplete(
                    (result, ex) -> {
                        if (ex != null) {
                            test(ex instanceof CommunicatorDestroyedException);
                        } else {
                            test(executor.isCustomExecutorThread());
                        }
                    });
                InvocationFuture<Void> f = Util.getInvocationFuture(r);
                f.whenSentAsync(
                    (sentSynchronously, ex) -> {
                        test(ex == null);
                        test(executor.isCustomExecutorThread());
                    },
                    executor);
                if (!f.sentSynchronously()) {
                    break;
                }
            }
            testController.resumeAdapter();
            r.join();
        }
        out.println("ok");
        p.shutdown();
    }

    private AllTests() {}
}
