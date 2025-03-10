// Copyright (c) ZeroC, Inc.
    
module Test
{
    sequence<int> Seq;
    dictionary<bool, int> Dict;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface I
    {
        Seq* f1();
        void f2(Seq*);
        void f3(out Seq*);
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        Dict* f4();
        void f5(Dict*);
        void f6(out Dict*);
        void op();
    }
}
