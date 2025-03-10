// Copyright (c) ZeroC, Inc.
    
module Test
{
    sequence<long> ls;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct s00
    {
        ls ls;      // OK as of Ice 3.6 (data member has its own scope)
        ls l;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct s0
    {
        Test::ls ls;        // OK
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct s1
    {
        ls mem;
        long ls;    // OK as of Ice 3.6 (data member has its own scope)
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct s2
    {
        Test::ls mem;
        long ls;    // OK
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    module M
    {
        sequence<long> ls;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface i1
    {
        M::ls op();
        void M();   // Changed meaning
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface i2
    {
        M::ls op();
        long M();   // Changed meaning
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    module N
    {
        interface n1 extends i1 {}
        interface i1 {}            // Changed meaning
        interface i2 extends i2 {} // Changed meaning
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    module O
    {
        interface n1 extends ::Test::i1 {}
        interface i1 {}                    // OK
        interface i2 extends ::Test::i2 {} // OK
    }
<<<<<<< HEAD
        
    exception e1 {}
        
    exception e2 {}
        
=======
<<<<<<< Updated upstream
    exception e1 {}
    exception e2 {}
=======

    exception e1 {}

    exception e2 {}

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    module E
    {
        exception ee1 extends e1 {}
        exception e1 {}            // Changed meaning
        exception e2 extends e2 {} // Changed meaning
    }
<<<<<<< HEAD
        
    interface c1 {}
        
    class c2 {}
        
=======
<<<<<<< Updated upstream
    interface c1 {}
    class c2 {}
=======

    interface c1 {}

    class c2 {}

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    module C
    {
        class c1 {}                // Changed meaning
        class c2 extends c2 {}     // Changed meaning
    }
<<<<<<< HEAD
        
    enum color { blue }
        
=======
<<<<<<< Updated upstream
    enum color { blue }
=======

    enum color { blue }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    module B
    {
        const color fc = blue;
        interface blue {}          // OK as of Ice 3.7 (enumerators are in their enum's namespace)
    }
<<<<<<< HEAD
        
    enum counter { one, two }
    sequence<counter> CounterSeq;
        
=======
<<<<<<< Updated upstream
    enum counter { one, two }
    sequence<counter> CounterSeq;

=======

    enum counter { one, two }
    sequence<counter> CounterSeq;

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    module SS
    {
        sequence<CounterSeq> y;
        enum CounterSeq { a, b }
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface ParamTest
    {
        void op(long param);
        void op2(counter param);
        void param(counter counter);        // OK as of Ice 3.6 (parameters have their own scope)
        void op3(long counter, counter x);  // OK as of Ice 3.6.1 (second "counter" is not a type)
        void op4(long param, long param);
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    sequence<int> IS;
    struct x
    {
        IS is;                              // OK as of Ice 3.6 (data member has its own scope)
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct y
    {
        ::Test::IS is;                      // OK, nothing introduced
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface Blah
    {
        void op1() throws ::Test::E::ee1;   // Nothing introduced
        void E();                           // OK
        void op2() throws E;                // Changed meaning
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface Blah2
    {
        void op3() throws ::Test::E::ee1;   // Nothing introduced
        void E();                           // OK
        void op4() throws E::ee1;           // Changed meaning
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface Blah3
    {
        void op5() throws E::ee1;           // Introduces E
        void E();                           // Changed meaning
    }
<<<<<<< HEAD
        
    module M1
    {
        enum smnpEnum { a }
            
=======
<<<<<<< Updated upstream

    module M1
    {
        enum smnpEnum { a }
=======

    module M1
    {
        enum smnpEnum { a }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        struct smnpStruct
        {
            smnpEnum e;
        }
<<<<<<< HEAD
            
        exception smnpException
        {
        }
            
=======
<<<<<<< Updated upstream

        exception smnpException
        {
        }

=======

        exception smnpException
        {
        }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        module M2
        {
            enum C { C1, C2, C3 }
        }
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    const Test::M1::M2::C MyConstant1 = Test::M1::M2::C::C2; // OK
    const ::Test::M1::M2::C MyConstant2 = Test::M1::M2::C::C2; // OK
    const Test::M1::M2::C MyConstant3 = ::Test::M1::M2::C::C2; // OK
    const ::Test::M1::M2::C MyConstant4 = ::Test::M1::M2::C::C2; // OK
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface smnpTest1Class
    {
        M1::smnpStruct smnpTest1Op1() throws M1::smnpException; // OK
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class Foo
    {
        string x;
        string X;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct Foo1
    {
        string x;
        string X;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface Foo2
    {
        void op1(int a, int A); // Changed meaning
        void op2(int Foo2); // OK
        void op3(int op3); // Ok
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception Foo5
    {
        string x;
        int X; // Changed meaning
    }
}
