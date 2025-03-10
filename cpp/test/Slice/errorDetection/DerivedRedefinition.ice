// Copyright (c) ZeroC, Inc.
    
module Test
{
    interface Base1
    {
        void op();
        void op2();
        void ice_ping();
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface Derived1 extends Base1
    {
        void op();                          // error
        long op();                          // error
        void foo();
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface Base2
    {
        void op();
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface D1 extends Base1
    {
        void foo();                         // OK
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface D2 extends D1
    {
        void op();                          // error, op() in Base1
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface D3 extends D1, Base2
    {
        void bar();                         // error, op() in Base1 and Base2
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class c1 { long l; }
    class c2 extends c1 { double l; }      // error
    class c3 extends c1 { double d; }      // OK
    class c4 extends c3 { short l; }       // error, l in c1
}
