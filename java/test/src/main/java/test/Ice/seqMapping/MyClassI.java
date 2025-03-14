// Copyright (c) ZeroC, Inc.

package test.Ice.seqMapping;

import test.Ice.seqMapping.Serialize.*;
import test.Ice.seqMapping.Test.*;

public final class MyClassI implements MyClass {
    @Override
    public void shutdown(com.zeroc.Ice.Current current) {
        current.adapter.getCommunicator().shutdown();
    }

    @Override
    public MyClass.OpSerialSmallJavaResult opSerialSmallJava(
            Small i, com.zeroc.Ice.Current current) {
        return new MyClass.OpSerialSmallJavaResult(i, i);
    }

    @Override
    public MyClass.OpSerialLargeJavaResult opSerialLargeJava(
            Large i, com.zeroc.Ice.Current current) {
        return new MyClass.OpSerialLargeJavaResult(i, i);
    }

    @Override
    public MyClass.OpSerialStructJavaResult opSerialStructJava(
            Struct i, com.zeroc.Ice.Current current) {
        return new MyClass.OpSerialStructJavaResult(i, i);
    }
}
