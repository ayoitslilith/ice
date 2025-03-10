// Copyright (c) ZeroC, Inc.
    
module Test
{
    sequence<string> StringSeq;
    ["cs:generic:List"]sequence<int> IntList;
    dictionary<string, string> StringDict;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class C
    {
        int i;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    ["cs:class"]
    struct S1
    {
        string name;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct S2
    {
        bool bo;
        byte by;
        short sh;
        int i;
        long l;
        float f;
        double d;
        string str;
        StringSeq ss;
        IntList il;
        StringDict sd;
        S1 s;
        C cls;
        Object* prx;
    }
}
