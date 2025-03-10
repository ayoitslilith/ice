// Copyright (c) ZeroC, Inc.
    
module Test
{
    module Module1 { }
    module Module2 { }
    module Module3 { }
    module Mod
    {
        sequence<Mod> Seq;
        dictionary<int, Mod> Dict;
        interface BarIntf extends Mod { void op(); }
        class BarClass1 extends Mod { long l; }
        // class BarClass2 implements Module1, Module2, Module3 { long l; }
        // class BarClass3 extends Mod implements Module1, Module2, Module3 { long l; }
    }
<<<<<<< HEAD
        
    exception E { }
        
=======
<<<<<<< Updated upstream
    exception E { }
=======

    exception E { }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct S
    {
        E e;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface I
    {
        E foo(E e1; E e2);
        void op();
    }
}
