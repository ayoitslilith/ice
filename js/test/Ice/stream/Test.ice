// Copyright (c) ZeroC, Inc.
    
#pragma once
    
#include "Ice/BuiltinSequences.ice"
    
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
