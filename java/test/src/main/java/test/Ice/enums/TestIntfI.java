// Copyright (c) ZeroC, Inc.

package test.Ice.enums;

import com.zeroc.Ice.Current;

import test.Ice.enums.Test.ByteEnum;
import test.Ice.enums.Test.IntEnum;
import test.Ice.enums.Test.ShortEnum;
import test.Ice.enums.Test.SimpleEnum;
import test.Ice.enums.Test.TestIntf;

public final class TestIntfI implements TestIntf {
    @Override
    public TestIntf.OpByteResult opByte(ByteEnum b1, Current current) {
        return new TestIntf.OpByteResult(b1, b1);
    }

    @Override
    public TestIntf.OpShortResult opShort(ShortEnum s1, Current current) {
        return new TestIntf.OpShortResult(s1, s1);
    }

    @Override
    public TestIntf.OpIntResult opInt(IntEnum i1, Current current) {
        return new TestIntf.OpIntResult(i1, i1);
    }

    @Override
    public TestIntf.OpSimpleResult opSimple(SimpleEnum s1, Current current) {
        return new TestIntf.OpSimpleResult(s1, s1);
    }

    @Override
    public TestIntf.OpByteSeqResult opByteSeq(ByteEnum[] b1, Current current) {
        return new TestIntf.OpByteSeqResult(b1, b1);
    }

    @Override
    public TestIntf.OpShortSeqResult opShortSeq(ShortEnum[] s1, Current current) {
        return new TestIntf.OpShortSeqResult(s1, s1);
    }

    @Override
    public TestIntf.OpIntSeqResult opIntSeq(IntEnum[] i1, Current current) {
        return new TestIntf.OpIntSeqResult(i1, i1);
    }

    @Override
    public TestIntf.OpSimpleSeqResult opSimpleSeq(SimpleEnum[] s1, Current current) {
        return new TestIntf.OpSimpleSeqResult(s1, s1);
    }

    @Override
    public void shutdown(Current current) {
        current.adapter.getCommunicator().shutdown();
    }
}
