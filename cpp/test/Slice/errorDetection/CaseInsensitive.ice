// Copyright (c) ZeroC, Inc.
    
module Test
{
    interface i1
    {
        void op();
        void op();
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface i2
    {
        void op();
        void oP();
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface iice
    {
        void ice_isa();
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    module m1
    {}
    module m1
    {}
    module M1
    {}
    module c1
    {}
    module C1
    {}
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface i3
    {
        void op(long aa, int aa);
        void op2(long bb, out int BB);
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface i4
    {
        void I4();
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface i5
    {
        void i5();
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface i6
    {
        void op();
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface i7 extends i6
    {
        void op();
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface i8 extends i6
    {
        void OP();
    }
<<<<<<< HEAD
        
    class c3
    {
        long l;
    }
        
    class c7 extends c3
    {
        long l;
    }
        
    class c8 extends c3
    {
        long L;
    }
        
    exception e1
    {
        long l;
        string l;
    }
        
    exception e2
    {
        long l;
        string L;
    }
        
    exception e3
    {
        long e3;
    }
        
    exception e4
    {
        long E4;
    }
        
    exception e5
    {
        long l;
    }
        
    exception e6 extends e5
    {
        string l;
    }
        
=======
<<<<<<< Updated upstream

    class c3
    {
        long l;
    }

    class c7 extends c3
    {
        long l;
    }

    class c8 extends c3
    {
        long L;
    }

    exception e1
    {
        long l;
        string l;
    }

    exception e2
    {
        long l;
        string L;
    }

    exception e3
    {
        long e3;
    }

    exception e4
    {
        long E4;
    }

    exception e5
    {
        long l;
    }

    exception e6 extends e5
    {
        string l;
    }

=======

    class c3
    {
        long l;
    }

    class c7 extends c3
    {
        long l;
    }

    class c8 extends c3
    {
        long L;
    }

    exception e1
    {
        long l;
        string l;
    }

    exception e2
    {
        long l;
        string L;
    }

    exception e3
    {
        long e3;
    }

    exception e4
    {
        long E4;
    }

    exception e5
    {
        long l;
    }

    exception e6 extends e5
    {
        string l;
    }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception e7 extends e5
    {
        string L;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct s1
    {
        long l;
        string l;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct s2
    {
        long l;
        string L;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct s3
    {
        long s3;
        string x;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct s4
    {
        long S4;
        string x;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    sequence<long> ls;
    sequence<long> LS;
    sequence<long> m1;
    sequence<long> M1;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    dictionary<long, string> d;
    dictionary<long, string> D;
    dictionary<long, string> m1;
    dictionary<long, string> M1;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    enum en1 { red }
    enum eN1 { lilac }
    enum m1 { green }
    enum M1 { blue }
    enum en2 { yellow, en1, EN1}
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    module xxx::xx
    {
        interface Base
        {
            void op();
        }
<<<<<<< HEAD
            
        interface Derived extends Base
        {
        }
            
        interface Derived extends base
        {
        }
            
        exception e1
        {
        }
            
        exception e2 extends E1
        {
        }
            
=======
<<<<<<< Updated upstream

        interface Derived extends Base
        {
        }

        interface Derived extends base
        {
        }

        exception e1
        {
        }

        exception e2 extends E1
        {
        }

=======

        interface Derived extends Base
        {
        }

        interface Derived extends base
        {
        }

        exception e1
        {
        }

        exception e2 extends E1
        {
        }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        sequence<long> s1;
        struct s
        {
            S1 x;
            xxx::xx::S1 y;
            xxx::XX::s1 z;
            xxx::XX::s1 w;
        }
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        struct s2
        {
            Derived* blah;
            derived* bletch;
        }
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface Foo
    {
        void op(long param, string Param);
        void op2() throws e1;
        void op3() throws E1;
        void op4() throws Test::xxx::xx::e1;
        void op5() throws Test::xxx::xx::E1;
        void op6() throws Test::xxx::XX::e1;
        void op7() throws Test::XXX::xx::e1;
        void op8() throws ::Test::xxx::xx::e1;
        void op9() throws ::Test::xxx::xx::E1;
        void op10() throws ::Test::xxx::XX::e1;
        void op11() throws ::Test::XXX::xx::e1;
        void op12(long op12);
        void op13(long OP13);
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    module CI
    {
        interface base1
        {
            void op();
        }
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        interface base2
        {
            void OP();
        }
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        interface derived extends base1, base2
        {
        }
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    module DI
    {
        interface base
        {
            void aa(int AA);
            void xx(int base);
        }
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        class base1
        {
            int base1;
        }
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        struct Foo
        {
            int foo;
        }
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        struct Foo1
        {
            int Foo1;
        }
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        exception Bar
        {
            string bar;
        }
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        exception Bar1
        {
            string Bar1;
        }
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        class base2
        {
            int X;
        }
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        class derived2 extends base2
        {
            string x;
        }
    }
}
