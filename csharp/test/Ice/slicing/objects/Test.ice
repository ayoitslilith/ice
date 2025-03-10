// Copyright (c) ZeroC, Inc.
    
#pragma once
    
module Test
{
    class SBase
    {
        string sb;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class SBSKnownDerived extends SBase
    {
        string sbskd;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class B
    {
        string sb;
        B pb;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class D1 extends B
    {
        string sd1;
        B pd1;
    }
<<<<<<< HEAD
        
    sequence<B> BSeq;
        
=======
<<<<<<< Updated upstream

    sequence<B> BSeq;

=======

    sequence<B> BSeq;

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class SS1
    {
        BSeq s;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class SS2
    {
        BSeq s;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct SS3
    {
        SS1 c1;
        SS2 c2;
    }
<<<<<<< HEAD
        
    dictionary<int, B> BDict;
        
=======
<<<<<<< Updated upstream

    dictionary<int, B> BDict;

=======

    dictionary<int, B> BDict;

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception BaseException
    {
        string sbe;
        B pb;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception DerivedException extends BaseException
    {
        string sde;
        D1 pd1;
    }
<<<<<<< HEAD
        
    class Forward;
        
=======
<<<<<<< Updated upstream

    class Forward;

=======

    class Forward;

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class PBase
    {
        int pi;
    }
<<<<<<< HEAD
        
    sequence<PBase> PBaseSeq;
        
=======
<<<<<<< Updated upstream

    sequence<PBase> PBaseSeq;

=======

    sequence<PBase> PBaseSeq;

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class Preserved extends PBase
    {
        string ps;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class PDerived extends Preserved
    {
        PBase pb;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class CompactPDerived(56) extends Preserved
    {
        PBase pb;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class PNode
    {
        PNode next;
    }
<<<<<<< HEAD
        
    exception PreservedException
    {
    }
        
=======
<<<<<<< Updated upstream

    exception PreservedException
    {
    }

=======

    exception PreservedException
    {
    }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    ["format:sliced"]
    interface TestIntf
    {
        Object SBaseAsObject();
        SBase SBaseAsSBase();
        SBase SBSKnownDerivedAsSBase();
        SBSKnownDerived SBSKnownDerivedAsSBSKnownDerived();
<<<<<<< HEAD
            
        SBase SBSUnknownDerivedAsSBase();
            
        ["format:compact"] SBase SBSUnknownDerivedAsSBaseCompact();
            
        Object SUnknownAsObject();
        void checkSUnknown(Object o);
            
=======
<<<<<<< Updated upstream

        SBase SBSUnknownDerivedAsSBase();

        ["format:compact"] SBase SBSUnknownDerivedAsSBaseCompact();

        Object SUnknownAsObject();
        void checkSUnknown(Object o);

=======

        SBase SBSUnknownDerivedAsSBase();

        ["format:compact"] SBase SBSUnknownDerivedAsSBaseCompact();

        Object SUnknownAsObject();
        void checkSUnknown(Object o);

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        B oneElementCycle();
        B twoElementCycle();
        B D1AsB();
        D1 D1AsD1();
        B D2AsB();
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        void paramTest1(out B p1, out B p2);
        void paramTest2(out B p2, out B p1);
        B paramTest3(out B p1, out B p2);
        B paramTest4(out B p);
<<<<<<< HEAD
            
        B returnTest1(out B p1, out B p2);
        B returnTest2(out B p2, out B p1);
        B returnTest3(B p1, B p2);
            
        SS3 sequenceTest(SS1 p1, SS2 p2);
            
        BDict dictionaryTest(BDict bin, out BDict bout);
            
        PBase exchangePBase(PBase pb);
            
        Preserved PBSUnknownAsPreserved();
        void checkPBSUnknown(Preserved p);
            
        ["amd"] Preserved PBSUnknownAsPreservedWithGraph();
        void checkPBSUnknownWithGraph(Preserved p);
            
        ["amd"] Preserved PBSUnknown2AsPreservedWithGraph();
        void checkPBSUnknown2WithGraph(Preserved p);
            
        PNode exchangePNode(PNode pn);
            
=======
<<<<<<< Updated upstream

        B returnTest1(out B p1, out B p2);
        B returnTest2(out B p2, out B p1);
        B returnTest3(B p1, B p2);

        SS3 sequenceTest(SS1 p1, SS2 p2);

        BDict dictionaryTest(BDict bin, out BDict bout);

        PBase exchangePBase(PBase pb);

        Preserved PBSUnknownAsPreserved();
        void checkPBSUnknown(Preserved p);

        ["amd"] Preserved PBSUnknownAsPreservedWithGraph();
        void checkPBSUnknownWithGraph(Preserved p);

        ["amd"] Preserved PBSUnknown2AsPreservedWithGraph();
        void checkPBSUnknown2WithGraph(Preserved p);

        PNode exchangePNode(PNode pn);

=======

        B returnTest1(out B p1, out B p2);
        B returnTest2(out B p2, out B p1);
        B returnTest3(B p1, B p2);

        SS3 sequenceTest(SS1 p1, SS2 p2);

        BDict dictionaryTest(BDict bin, out BDict bout);

        PBase exchangePBase(PBase pb);

        Preserved PBSUnknownAsPreserved();
        void checkPBSUnknown(Preserved p);

        ["amd"] Preserved PBSUnknownAsPreservedWithGraph();
        void checkPBSUnknownWithGraph(Preserved p);

        ["amd"] Preserved PBSUnknown2AsPreservedWithGraph();
        void checkPBSUnknown2WithGraph(Preserved p);

        PNode exchangePNode(PNode pn);

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        void throwBaseAsBase() throws BaseException;
        void throwDerivedAsBase() throws BaseException;
        void throwDerivedAsDerived() throws DerivedException;
        void throwUnknownDerivedAsBase() throws BaseException;
        ["amd"] void throwPreservedException() throws PreservedException;
<<<<<<< HEAD
            
        void useForward(out Forward f); /* Use of forward-declared class to verify that code is generated correctly. */
            
        void shutdown();
    }
        
=======
<<<<<<< Updated upstream

        void useForward(out Forward f); /* Use of forward-declared class to verify that code is generated correctly. */

        void shutdown();
    }

=======

        void useForward(out Forward f); /* Use of forward-declared class to verify that code is generated correctly. */

        void shutdown();
    }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class Hidden
    {
        Forward f;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class Forward
    {
        Hidden h;
    }
}
