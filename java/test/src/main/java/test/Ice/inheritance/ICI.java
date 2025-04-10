// Copyright (c) ZeroC, Inc.

package test.Ice.inheritance;

import com.zeroc.Ice.Current;

import test.Ice.inheritance.Test.MA.IAPrx;
import test.Ice.inheritance.Test.MA.IC;
import test.Ice.inheritance.Test.MA.ICPrx;
import test.Ice.inheritance.Test.MB.IB1Prx;
import test.Ice.inheritance.Test.MB.IB2Prx;

public final class ICI implements IC {
    public ICI() {}

    @Override
    public IAPrx iaop(IAPrx p, Current current) {
        return p;
    }

    @Override
    public ICPrx icop(ICPrx p, Current current) {
        return p;
    }

    @Override
    public IB1Prx ib1op(IB1Prx p, Current current) {
        return p;
    }

    @Override
    public IB2Prx ib2op(IB2Prx p, Current current) {
        return p;
    }
}
