// Copyright (c) ZeroC, Inc.
    
module M
{
    class C { long l; }
    sequence<int> S;
    dictionary<string, string> D;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface Bar
    {
        void foo1() throws C;
        void foo2() throws S;
        void foo3() throws D;
        void foo4() throws int;
        void op();
    }
}
