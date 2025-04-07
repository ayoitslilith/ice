// Copyright (c) ZeroC, Inc.

package test.Ice.scope;

import com.zeroc.Ice.Communicator;
import com.zeroc.Ice.Current;
import com.zeroc.Ice.ObjectAdapter;
import com.zeroc.Ice.Properties;
import com.zeroc.Ice.Util;

import test.Ice.scope.Test.*;
import test.TestHelper;

import java.util.Map;

public class Server extends TestHelper {
    class MyInterface1 implements MyInterface {
        public MyInterface.OpMyStructResult opMyStruct(
                MyStruct s1, Current current) {
            var result = new MyInterface.OpMyStructResult();
            result.returnValue = s1;
            result.s2 = s1;
            return result;
        }

        public MyInterface.OpMyStructSeqResult opMyStructSeq(
                MyStruct[] s1, Current current) {
            var result = new MyInterface.OpMyStructSeqResult();
            result.returnValue = s1;
            result.s2 = s1;
            return result;
        }

        public MyInterface.OpMyStructMapResult opMyStructMap(
                Map<String, MyStruct> s1,
                Current current) {
            var result = new MyInterface.OpMyStructMapResult();
            result.returnValue = s1;
            result.s2 = s1;
            return result;
        }

        public MyInterface.OpMyClassResult opMyClass(
                MyClass c1, Current current) {
            var result = new MyInterface.OpMyClassResult();
            result.returnValue = c1;
            result.c2 = c1;
            return result;
        }

        public MyInterface.OpMyClassSeqResult opMyClassSeq(
                MyClass[] c1, Current current) {
            var result = new MyInterface.OpMyClassSeqResult();
            result.returnValue = c1;
            result.c2 = c1;
            return result;
        }

        public MyInterface.OpMyClassMapResult opMyClassMap(
                Map<String, MyClass> c1,
                Current current) {
            var result = new MyInterface.OpMyClassMapResult();
            result.returnValue = c1;
            result.c2 = c1;
            return result;
        }

        public MyEnum opMyEnum(
                MyEnum e1, Current current) {
            return e1;
        }

        public MyOtherStruct opMyOtherStruct(
                MyOtherStruct s1, Current current) {
            return s1;
        }

        public MyOtherClass opMyOtherClass(
                MyOtherClass e1, Current current) {
            return e1;
        }

        public void shutdown(Current current) {
            current.adapter.getCommunicator().shutdown();
        }
    }

    class MyInterface2 implements test.Ice.scope.Test.Inner.MyInterface {
        public test.Ice.scope.Test.Inner.MyInterface.OpMyStructResult opMyStruct(
                test.Ice.scope.Test.Inner.Inner2.MyStruct s1, Current current) {
            var result = new test.Ice.scope.Test.Inner.MyInterface.OpMyStructResult();
            result.returnValue = s1;
            result.s2 = s1;
            return result;
        }

        public test.Ice.scope.Test.Inner.MyInterface.OpMyStructSeqResult opMyStructSeq(
                test.Ice.scope.Test.Inner.Inner2.MyStruct[] s1, Current current) {
            var result = new test.Ice.scope.Test.Inner.MyInterface.OpMyStructSeqResult();
            result.returnValue = s1;
            result.s2 = s1;
            return result;
        }

        public test.Ice.scope.Test.Inner.MyInterface.OpMyStructMapResult opMyStructMap(
                Map<String, test.Ice.scope.Test.Inner.Inner2.MyStruct> s1,
                Current current) {
            var result = new test.Ice.scope.Test.Inner.MyInterface.OpMyStructMapResult();
            result.returnValue = s1;
            result.s2 = s1;
            return result;
        }

        public test.Ice.scope.Test.Inner.MyInterface.OpMyClassResult opMyClass(
                test.Ice.scope.Test.Inner.Inner2.MyClass c1, Current current) {
            var result = new test.Ice.scope.Test.Inner.MyInterface.OpMyClassResult();
            result.returnValue = c1;
            result.c2 = c1;
            return result;
        }

        public test.Ice.scope.Test.Inner.MyInterface.OpMyClassSeqResult opMyClassSeq(
                test.Ice.scope.Test.Inner.Inner2.MyClass[] c1, Current current) {
            var result = new test.Ice.scope.Test.Inner.MyInterface.OpMyClassSeqResult();
            result.returnValue = c1;
            result.c2 = c1;
            return result;
        }

        public test.Ice.scope.Test.Inner.MyInterface.OpMyClassMapResult opMyClassMap(
                Map<String, test.Ice.scope.Test.Inner.Inner2.MyClass> c1,
                Current current) {
            var result = new test.Ice.scope.Test.Inner.MyInterface.OpMyClassMapResult();
            result.returnValue = c1;
            result.c2 = c1;
            return result;
        }

        public void shutdown(Current current) {
            current.adapter.getCommunicator().shutdown();
        }
    }

    class MyInterface3 implements test.Ice.scope.Test.Inner.Inner2.MyInterface {
        public test.Ice.scope.Test.Inner.Inner2.MyInterface.OpMyStructResult opMyStruct(
                test.Ice.scope.Test.Inner.Inner2.MyStruct s1, Current current) {
            var result = new test.Ice.scope.Test.Inner.Inner2.MyInterface.OpMyStructResult();
            result.returnValue = s1;
            result.s2 = s1;
            return result;
        }

        public test.Ice.scope.Test.Inner.Inner2.MyInterface.OpMyStructSeqResult opMyStructSeq(
                test.Ice.scope.Test.Inner.Inner2.MyStruct[] s1, Current current) {
            var result = new test.Ice.scope.Test.Inner.Inner2.MyInterface.OpMyStructSeqResult();
            result.returnValue = s1;
            result.s2 = s1;
            return result;
        }

        public test.Ice.scope.Test.Inner.Inner2.MyInterface.OpMyStructMapResult opMyStructMap(
                Map<String, test.Ice.scope.Test.Inner.Inner2.MyStruct> s1,
                Current current) {
            var result = new test.Ice.scope.Test.Inner.Inner2.MyInterface.OpMyStructMapResult();
            result.returnValue = s1;
            result.s2 = s1;
            return result;
        }

        public test.Ice.scope.Test.Inner.Inner2.MyInterface.OpMyClassResult opMyClass(
                test.Ice.scope.Test.Inner.Inner2.MyClass c1, Current current) {
            var result = new test.Ice.scope.Test.Inner.Inner2.MyInterface.OpMyClassResult();
            result.returnValue = c1;
            result.c2 = c1;
            return result;
        }

        public test.Ice.scope.Test.Inner.Inner2.MyInterface.OpMyClassSeqResult opMyClassSeq(
                test.Ice.scope.Test.Inner.Inner2.MyClass[] c1, Current current) {
            var result = new test.Ice.scope.Test.Inner.Inner2.MyInterface.OpMyClassSeqResult();
            result.returnValue = c1;
            result.c2 = c1;
            return result;
        }

        public test.Ice.scope.Test.Inner.Inner2.MyInterface.OpMyClassMapResult opMyClassMap(
                Map<String, test.Ice.scope.Test.Inner.Inner2.MyClass> c1,
                Current current) {
            var result = new test.Ice.scope.Test.Inner.Inner2.MyInterface.OpMyClassMapResult();
            result.returnValue = c1;
            result.c2 = c1;
            return result;
        }

        public void shutdown(Current current) {
            current.adapter.getCommunicator().shutdown();
        }
    }

    class MyInterface4 implements test.Ice.scope.Inner.Test.Inner2.MyInterface {
        public test.Ice.scope.Inner.Test.Inner2.MyInterface.OpMyStructResult opMyStruct(
                MyStruct s1, Current current) {
            var result = new test.Ice.scope.Inner.Test.Inner2.MyInterface.OpMyStructResult();
            result.returnValue = s1;
            result.s2 = s1;
            return result;
        }

        public test.Ice.scope.Inner.Test.Inner2.MyInterface.OpMyStructSeqResult opMyStructSeq(
                MyStruct[] s1, Current current) {
            var result = new test.Ice.scope.Inner.Test.Inner2.MyInterface.OpMyStructSeqResult();
            result.returnValue = s1;
            result.s2 = s1;
            return result;
        }

        public test.Ice.scope.Inner.Test.Inner2.MyInterface.OpMyStructMapResult opMyStructMap(
                Map<String, MyStruct> s1,
                Current current) {
            var result = new test.Ice.scope.Inner.Test.Inner2.MyInterface.OpMyStructMapResult();
            result.returnValue = s1;
            result.s2 = s1;
            return result;
        }

        public test.Ice.scope.Inner.Test.Inner2.MyInterface.OpMyClassResult opMyClass(
                MyClass c1, Current current) {
            var result = new test.Ice.scope.Inner.Test.Inner2.MyInterface.OpMyClassResult();
            result.returnValue = c1;
            result.c2 = c1;
            return result;
        }

        public test.Ice.scope.Inner.Test.Inner2.MyInterface.OpMyClassSeqResult opMyClassSeq(
                MyClass[] c1, Current current) {
            var result = new test.Ice.scope.Inner.Test.Inner2.MyInterface.OpMyClassSeqResult();
            result.returnValue = c1;
            result.c2 = c1;
            return result;
        }

        public test.Ice.scope.Inner.Test.Inner2.MyInterface.OpMyClassMapResult opMyClassMap(
                Map<String, MyClass> c1,
                Current current) {
            var result = new test.Ice.scope.Inner.Test.Inner2.MyInterface.OpMyClassMapResult();
            result.returnValue = c1;
            result.c2 = c1;
            return result;
        }

        public void shutdown(Current current) {
            current.adapter.getCommunicator().shutdown();
        }
    }

    public void run(String[] args) {
        Properties properties = createTestProperties(args);
        properties.setProperty("Ice.Package.Test", "test.Ice.scope");
        try (Communicator communicator = initialize(properties)) {
            communicator.getProperties().setProperty("TestAdapter.Endpoints", getTestEndpoint(0));
            ObjectAdapter adapter = communicator.createObjectAdapter("TestAdapter");
            adapter.add(new MyInterface1(), Util.stringToIdentity("i1"));
            adapter.add(new MyInterface2(), Util.stringToIdentity("i2"));
            adapter.add(new MyInterface3(), Util.stringToIdentity("i3"));
            adapter.add(new MyInterface4(), Util.stringToIdentity("i4"));
            adapter.activate();
            serverReady();
            communicator.waitForShutdown();
        }
    }
}
