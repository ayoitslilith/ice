// Copyright (c) ZeroC, Inc.

package test.Ice.metrics;

import com.zeroc.Ice.Instrumentation.DispatchObserver;

class DispatchObserverI extends ObserverI
    implements DispatchObserver {
    @Override
    public synchronized void reset() {
        super.reset();
        userExceptionCount = 0;
        replySize = 0;
    }

    @Override
    public synchronized void userException() {
        ++userExceptionCount;
    }

    @Override
    public synchronized void reply(int s) {
        replySize += s;
    }

    int userExceptionCount;
    int replySize;
}
