// Copyright (c) ZeroC, Inc.

package test.Ice.objects;

import test.Ice.objects.Test.*;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CompletionStage;

public final class InitialI implements Initial {
    public InitialI(com.zeroc.Ice.ObjectAdapter adapter) {
        _adapter = adapter;
        _b1 = new BI();
        _b2 = new BI();
        _c = new CI();
        _d = new DI();

        _b1.theA = _b2; // Cyclic reference to another B
        _b1.theB = _b1; // Self reference.
        _b1.theC = null; // Null reference.

        _b2.theA = _b2; // Self reference, using base.
        _b2.theB = _b1; // Cyclic reference to another B
        _b2.theC = _c; // Cyclic reference to a C.

        _c.theB = _b2; // Cyclic reference to a B.

        _d.theA = _b1; // Reference to a B.
        _d.theB = _b2; // Reference to a B.
        _d.theC = null; // Reference to a C.
    }

    @Override
    public Initial.GetAllResult getAll(com.zeroc.Ice.Current current) {
        Initial.GetAllResult r = new Initial.GetAllResult();
        _b1.preMarshalInvoked = false;
        _b2.preMarshalInvoked = false;
        _c.preMarshalInvoked = false;
        _d.preMarshalInvoked = false;
        r.b1 = _b1;
        r.b2 = _b2;
        r.theC = _c;
        r.theD = _d;
        return r;
    }

    @Override
    public B getB1(com.zeroc.Ice.Current current) {
        _b1.preMarshalInvoked = false;
        _b2.preMarshalInvoked = false;
        _c.preMarshalInvoked = false;
        return _b1;
    }

    @Override
    public B getB2(com.zeroc.Ice.Current current) {
        _b1.preMarshalInvoked = false;
        _b2.preMarshalInvoked = false;
        _c.preMarshalInvoked = false;
        return _b2;
    }

    @Override
    public C getC(com.zeroc.Ice.Current current) {
        _b1.preMarshalInvoked = false;
        _b2.preMarshalInvoked = false;
        _c.preMarshalInvoked = false;
        return _c;
    }

    @Override
    public D getD(com.zeroc.Ice.Current current) {
        _b1.preMarshalInvoked = false;
        _b2.preMarshalInvoked = false;
        _c.preMarshalInvoked = false;
        _d.preMarshalInvoked = false;
        return _d;
    }

    @Override
    public void setRecursive(Recursive r, com.zeroc.Ice.Current current) {}

    @Override
    public void setCycle(Recursive r, com.zeroc.Ice.Current current) {}

    @Override
    public boolean acceptsClassCycles(com.zeroc.Ice.Current current) {
        return true;
    }

    @Override
    public K getK(com.zeroc.Ice.Current current) {
        return new K(new L("l"));
    }

    @Override
    public OpValueResult opValue(com.zeroc.Ice.Value v1, com.zeroc.Ice.Current current) {
        return new OpValueResult(v1, v1);
    }

    @Override
    public OpValueSeqResult opValueSeq(com.zeroc.Ice.Value[] v1, com.zeroc.Ice.Current current) {
        return new OpValueSeqResult(v1, v1);
    }

    @Override
    public OpValueMapResult opValueMap(
            java.util.Map<String, com.zeroc.Ice.Value> v1, com.zeroc.Ice.Current current) {
        return new OpValueMapResult(v1, v1);
    }

    @Override
    public D1 getD1(D1 d1, com.zeroc.Ice.Current current) {
        return d1;
    }

    @Override
    public GetMBMarshaledResult getMB(com.zeroc.Ice.Current current) {
        return new GetMBMarshaledResult(_b1, current);
    }

    @Override
    public CompletionStage<GetAMDMBMarshaledResult> getAMDMBAsync(com.zeroc.Ice.Current current) {
        return CompletableFuture.completedFuture(new GetAMDMBMarshaledResult(_b1, current));
    }

    @Override
    public void throwEDerived(com.zeroc.Ice.Current current) throws EDerived {
        throw new EDerived(new A1("a1"), new A1("a2"), new A1("a3"), new A1("a4"));
    }

    @Override
    public void setG(G theG, com.zeroc.Ice.Current current) {}

    @Override
    public Initial.OpBaseSeqResult opBaseSeq(Base[] inS, com.zeroc.Ice.Current current) {
        return new Initial.OpBaseSeqResult(inS, inS);
    }

    @Override
    public Compact getCompact(com.zeroc.Ice.Current current) {
        return new CompactExt();
    }

    @Override
    public test.Ice.objects.Test.Inner.A getInnerA(com.zeroc.Ice.Current current) {
        return new test.Ice.objects.Test.Inner.A(_b1);
    }

    @Override
    public test.Ice.objects.Test.Inner.Sub.A getInnerSubA(com.zeroc.Ice.Current current) {
        return new test.Ice.objects.Test.Inner.Sub.A(new test.Ice.objects.Test.Inner.A(_b1));
    }

    @Override
    public void throwInnerEx(com.zeroc.Ice.Current current) throws test.Ice.objects.Test.Inner.Ex {
        throw new test.Ice.objects.Test.Inner.Ex("Inner::Ex");
    }

    @Override
    public void throwInnerSubEx(com.zeroc.Ice.Current current)
            throws test.Ice.objects.Test.Inner.Sub.Ex {
        throw new test.Ice.objects.Test.Inner.Sub.Ex("Inner::Sub::Ex");
    }

    @Override
    public void shutdown(com.zeroc.Ice.Current current) {
        _adapter.getCommunicator().shutdown();
    }

    @Override
    public Initial.OpMResult opM(M v1, com.zeroc.Ice.Current current) {
        Initial.OpMResult r = new Initial.OpMResult();
        r.returnValue = v1;
        r.v2 = v1;
        return r;
    }

    @Override
    public Initial.OpF1Result opF1(F1 f11, com.zeroc.Ice.Current current) {
        Initial.OpF1Result r = new Initial.OpF1Result();
        r.returnValue = f11;
        r.f12 = new F1("F12");
        return r;
    }

    @Override
    public Initial.OpF2Result opF2(F2Prx f21, com.zeroc.Ice.Current current) {
        Initial.OpF2Result r = new Initial.OpF2Result();
        r.returnValue = f21;
        r.f22 = F2Prx.createProxy(current.adapter.getCommunicator(), "F22");
        return r;
    }

    @Override
    public Initial.OpF3Result opF3(F3 f31, com.zeroc.Ice.Current current) {
        Initial.OpF3Result r = new Initial.OpF3Result();
        r.returnValue = f31;
        r.f32 = new F3(new F1("F12"), F2Prx.createProxy(current.adapter.getCommunicator(), "F22"));
        return r;
    }

    @Override
    public boolean hasF3(com.zeroc.Ice.Current current) {
        return true;
    }

    private com.zeroc.Ice.ObjectAdapter _adapter;
    private B _b1;
    private B _b2;
    private C _c;
    private D _d;
}
