// Copyright (c) ZeroC, Inc.
    
#pragma once
    
module LocalTest
{
    class C1
    {
        int i;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct S1
    {
        C1 c1;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    sequence<C1> C1Seq;
    sequence<S1> S1Seq;
    dictionary<int, C1> C1Dict;
    dictionary<int, S1> S1Dict;
<<<<<<< HEAD
        
    sequence<C1Seq> C1SeqSeq;
    sequence<S1Seq> S1SeqSeq;
        
=======
<<<<<<< Updated upstream

    sequence<C1Seq> C1SeqSeq;
    sequence<S1Seq> S1SeqSeq;

=======

    sequence<C1Seq> C1SeqSeq;
    sequence<S1Seq> S1SeqSeq;

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct S2
    {
        S1 s1;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct S3
    {
        C1Seq c1seq;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct S4
    {
        S1Seq s1seq;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct S5
    {
        C1Dict c1dict;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct S6
    {
        S1Dict s1dict;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct S7
    {
        C1SeqSeq c1seqseq;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct S8
    {
        S1SeqSeq s1seqseq;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class CB1
    {
        S1 s1;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class CB2
    {
        C1Seq c1seq;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class CB3
    {
        S1Seq s1seq;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class CB4
    {
        C1Dict c1dict;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class CB5
    {
        S1Dict s1dict;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class CB6
    {
        C1SeqSeq c1seqseq;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class CB7
    {
        S1SeqSeq s1seqseq;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class CB8
    {
        S1 s1;
        C1Seq c1seq;
        S1Dict s1dict;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct StructKey
    {
        int i;
        int j;
    }
<<<<<<< HEAD
        
    dictionary<StructKey, C1> StructDict1;
    dictionary<StructKey, S1> StructDict2;
        
=======
<<<<<<< Updated upstream

    dictionary<StructKey, C1> StructDict1;
    dictionary<StructKey, S1> StructDict2;

=======

    dictionary<StructKey, C1> StructDict1;
    dictionary<StructKey, S1> StructDict2;

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    dictionary<int, C1Dict> C1DictDict;
    dictionary<int, S1Dict> S1DictDict;
}
