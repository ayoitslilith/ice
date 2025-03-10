// Copyright (c) ZeroC, Inc.
    
#pragma once
    
module Test
{
    //
    // Duplicate types from Test.ice. We cannot use #include since
    // that will use the types from the same prefix.
    //
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception Base
    {
        string b;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception KnownDerived extends Base
    {
        string kd;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception KnownIntermediate extends Base
    {
        string ki;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception KnownMostDerived extends KnownIntermediate
    {
        string kmd;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception KnownPreserved extends Base
    {
        string kp;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception KnownPreservedDerived extends KnownPreserved
    {
        string kpd;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class BaseClass
    {
        string bc;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface Relay
    {
        void knownPreservedAsBase() throws Base;
        void knownPreservedAsKnownPreserved() throws KnownPreserved;
<<<<<<< HEAD
            
        void unknownPreservedAsBase() throws Base;
        void unknownPreservedAsKnownPreserved() throws KnownPreserved;
    }
        
=======
<<<<<<< Updated upstream

        void unknownPreservedAsBase() throws Base;
        void unknownPreservedAsKnownPreserved() throws KnownPreserved;
    }

=======

        void unknownPreservedAsBase() throws Base;
        void unknownPreservedAsKnownPreserved() throws KnownPreserved;
    }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface TestIntf
    {
        void baseAsBase() throws Base;
        void unknownDerivedAsBase() throws Base;
        void knownDerivedAsBase() throws Base;
        void knownDerivedAsKnownDerived() throws KnownDerived;
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        void unknownIntermediateAsBase() throws Base;
        void knownIntermediateAsBase() throws Base;
        void knownMostDerivedAsBase() throws Base;
        void knownIntermediateAsKnownIntermediate() throws KnownIntermediate;
        void knownMostDerivedAsKnownIntermediate() throws KnownIntermediate;
        void knownMostDerivedAsKnownMostDerived() throws KnownMostDerived;
<<<<<<< HEAD
            
        void unknownMostDerived1AsBase() throws Base;
        void unknownMostDerived1AsKnownIntermediate() throws KnownIntermediate;
        void unknownMostDerived2AsBase() throws Base;
            
        ["format:compact"] void unknownMostDerived2AsBaseCompact() throws Base;
            
        void knownPreservedAsBase() throws Base;
        void knownPreservedAsKnownPreserved() throws KnownPreserved;
            
        void relayKnownPreservedAsBase(Relay* r) throws Base;
        void relayKnownPreservedAsKnownPreserved(Relay* r) throws KnownPreserved;
            
        void unknownPreservedAsBase() throws Base;
        void unknownPreservedAsKnownPreserved() throws KnownPreserved;
            
        void relayUnknownPreservedAsBase(Relay* r) throws Base;
        void relayUnknownPreservedAsKnownPreserved(Relay* r) throws KnownPreserved;
            
        void shutdown();
    }
        
    //
    // Types private to the client.
    //
        
=======
<<<<<<< Updated upstream

        void unknownMostDerived1AsBase() throws Base;
        void unknownMostDerived1AsKnownIntermediate() throws KnownIntermediate;
        void unknownMostDerived2AsBase() throws Base;

        ["format:compact"] void unknownMostDerived2AsBaseCompact() throws Base;

        void knownPreservedAsBase() throws Base;
        void knownPreservedAsKnownPreserved() throws KnownPreserved;

        void relayKnownPreservedAsBase(Relay* r) throws Base;
        void relayKnownPreservedAsKnownPreserved(Relay* r) throws KnownPreserved;

        void unknownPreservedAsBase() throws Base;
        void unknownPreservedAsKnownPreserved() throws KnownPreserved;

        void relayUnknownPreservedAsBase(Relay* r) throws Base;
        void relayUnknownPreservedAsKnownPreserved(Relay* r) throws KnownPreserved;

        void shutdown();
    }

    //
    // Types private to the client.
    //

=======

        void unknownMostDerived1AsBase() throws Base;
        void unknownMostDerived1AsKnownIntermediate() throws KnownIntermediate;
        void unknownMostDerived2AsBase() throws Base;

        ["format:compact"] void unknownMostDerived2AsBaseCompact() throws Base;

        void knownPreservedAsBase() throws Base;
        void knownPreservedAsKnownPreserved() throws KnownPreserved;

        void relayKnownPreservedAsBase(Relay* r) throws Base;
        void relayKnownPreservedAsKnownPreserved(Relay* r) throws KnownPreserved;

        void unknownPreservedAsBase() throws Base;
        void unknownPreservedAsKnownPreserved() throws KnownPreserved;

        void relayUnknownPreservedAsBase(Relay* r) throws Base;
        void relayUnknownPreservedAsKnownPreserved(Relay* r) throws KnownPreserved;

        void shutdown();
    }

    //
    // Types private to the client.
    //

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class PreservedClass extends BaseClass
    {
        string pc;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception Preserved1 extends KnownPreservedDerived
    {
        BaseClass p1;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception Preserved2 extends Preserved1
    {
        BaseClass p2;
    }
}
