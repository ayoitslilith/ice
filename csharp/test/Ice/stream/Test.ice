// Copyright (c) ZeroC, Inc.
    
#pragma once
    
// Suppress invalid metadata warnings which we expect this test to generate.
[["suppress-warning"]]
    
#include "Ice/BuiltinSequences.ice"
    
["cs:namespace:Ice.stream"]
module Test
{
    enum MyEnum
    {
        enum1,
        enum2,
        enum3
    }
<<<<<<< HEAD
        
    class MyClass;
    interface MyInterface;
        
=======
<<<<<<< Updated upstream

    class MyClass;
    interface MyInterface;

=======

    class MyClass;
    interface MyInterface;

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct LargeStruct
    {
        bool bo;
        byte by;
        short sh;
        int i;
        long l;
        float f;
        double d;
        string str;
        MyEnum e;
        MyInterface* p;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class OptionalClass
    {
        bool bo;
        byte by;
        optional(1) short sh;
        optional(2) int i;
    }
<<<<<<< HEAD
        
    sequence<MyEnum> MyEnumS;
    sequence<MyClass> MyClassS;
        
=======
<<<<<<< Updated upstream

    sequence<MyEnum> MyEnumS;
    sequence<MyClass> MyClassS;

=======

    sequence<MyEnum> MyEnumS;
    sequence<MyClass> MyClassS;

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    sequence<Ice::BoolSeq> BoolSS;
    sequence<Ice::ByteSeq> ByteSS;
    sequence<Ice::ShortSeq> ShortSS;
    sequence<Ice::IntSeq> IntSS;
    sequence<Ice::LongSeq> LongSS;
    sequence<Ice::FloatSeq> FloatSS;
    sequence<Ice::DoubleSeq> DoubleSS;
    sequence<Ice::StringSeq> StringSS;
    sequence<MyEnumS> MyEnumSS;
    sequence<MyClassS> MyClassSS;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    dictionary<byte, bool> ByteBoolD;
    dictionary<short, int> ShortIntD;
    dictionary<long, float> LongFloatD;
    dictionary<string, string> StringStringD;
    dictionary<string, MyClass> StringMyClassD;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    ["cs:generic:List"]
    sequence<bool> BoolList;
    ["cs:generic:List"]
    sequence<byte> ByteList;
    ["cs:generic:List"]
    sequence<MyEnum> MyEnumList;
    ["cs:generic:List"]
    sequence<LargeStruct> LargeStructList;
    ["cs:generic:List"]
    sequence<MyClass> MyClassList;
    ["cs:generic:List"]
    sequence<MyInterface*> MyInterfaceProxyList;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    ["cs:generic:LinkedList"]
    sequence<short> ShortLinkedList;
    ["cs:generic:LinkedList"]
    sequence<int> IntLinkedList;
    ["cs:generic:LinkedList"]
    sequence<MyEnum> MyEnumLinkedList;
    ["cs:generic:LinkedList"]
    sequence<LargeStruct> LargeStructLinkedList;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    ["cs:generic:Stack"]
    sequence<long> LongStack;
    ["cs:generic:Stack"]
    sequence<float> FloatStack;
    ["cs:generic:Stack"]
    sequence<LargeStruct> LargeStructStack;
    ["cs:generic:Stack"]
    sequence<MyInterface*> MyInterfaceProxyStack;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    //
    // This will produce a warning and use the default
    // sequence mapping. The generic:Stack metadata cannot be use
    // with object sequences.
    //
    ["cs:generic:Stack"]
    sequence<Object> ObjectStack;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    //
    // This will produce a warning and use the default
    // sequence mapping. The generic:Stack metadata cannot be use
    // with object sequences.
    //
    ["cs:generic:Stack"]
    sequence<MyClass> MyClassStack;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    ["cs:generic:Queue"]
    sequence<double> DoubleQueue;
    ["cs:generic:Queue"]
    sequence<string> StringQueue;
    ["cs:generic:Queue"]
    sequence<LargeStruct> LargeStructQueue;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    ["cs:generic:List"]
    sequence<Ice::StringSeq> StringSList;
    ["cs:generic:Stack"]
    sequence<Ice::StringSeq> StringSStack;
<<<<<<< HEAD
        
    ["cs:generic:SortedDictionary"]
    dictionary<string, string> SortedStringStringD;
        
=======
<<<<<<< Updated upstream

    ["cs:generic:SortedDictionary"]
    dictionary<string, string> SortedStringStringD;

=======

    ["cs:generic:SortedDictionary"]
    dictionary<string, string> SortedStringStringD;

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class MyClass
    {
        MyClass c;
        Object o;
        LargeStruct s;
        Ice::BoolSeq seq1;
        Ice::ByteSeq seq2;
        Ice::ShortSeq seq3;
        Ice::IntSeq seq4;
        Ice::LongSeq seq5;
        Ice::FloatSeq seq6;
        Ice::DoubleSeq seq7;
        Ice::StringSeq seq8;
        MyEnumS seq9;
        MyClassS seq10;
        StringMyClassD d;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception MyException
    {
        MyClass c;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface MyInterface
    {
    }
}
