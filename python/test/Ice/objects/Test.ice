// Copyright (c) ZeroC, Inc.
    
#pragma once
    
module Test
{
    struct S
    {
        string str;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class Base
    {
        S theS;
        string str;
    }
<<<<<<< HEAD
        
    class B;
    class C;
        
=======
<<<<<<< Updated upstream

    class B;
    class C;

=======

    class B;
    class C;

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class A
    {
        B theB;
        C theC;
<<<<<<< HEAD
            
        bool preMarshalInvoked;
        bool postUnmarshalInvoked;
    }
        
=======
<<<<<<< Updated upstream

        bool preMarshalInvoked;
        bool postUnmarshalInvoked;
    }

=======

        bool preMarshalInvoked;
        bool postUnmarshalInvoked;
    }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class B extends A
    {
        A theA;
    }
<<<<<<< HEAD
        
    class C
    {
        B theB;
            
        bool preMarshalInvoked;
        bool postUnmarshalInvoked;
    }
        
=======
<<<<<<< Updated upstream

    class C
    {
        B theB;

        bool preMarshalInvoked;
        bool postUnmarshalInvoked;
    }

=======

    class C
    {
        B theB;

        bool preMarshalInvoked;
        bool postUnmarshalInvoked;
    }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class D
    {
        A theA;
        B theB;
        C theC;
<<<<<<< HEAD
            
        bool preMarshalInvoked;
        bool postUnmarshalInvoked;
    }
        
=======
<<<<<<< Updated upstream

        bool preMarshalInvoked;
        bool postUnmarshalInvoked;
    }

=======

        bool preMarshalInvoked;
        bool postUnmarshalInvoked;
    }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    // Exercise empty class with non-empty base
    class G extends Base
    {
    }
<<<<<<< HEAD
        
    sequence<Base> BaseSeq;
        
    class CompactExt;
        
    class Compact(1)
    {
    }
        
    const int CompactExtId = 789;
        
    class CompactExt(CompactExtId) extends Compact
    {
    }
        
=======
<<<<<<< Updated upstream

    sequence<Base> BaseSeq;

    class CompactExt;

    class Compact(1)
    {
    }

    const int CompactExtId = 789;

    class CompactExt(CompactExtId) extends Compact
    {
    }

=======

    sequence<Base> BaseSeq;

    class CompactExt;

    class Compact(1)
    {
    }

    const int CompactExtId = 789;

    class CompactExt(CompactExtId) extends Compact
    {
    }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class A1
    {
        string name;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class B1
    {
        A1 a1;
        A1 a2;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class D1 extends B1
    {
        A1 a3;
        A1 a4;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception EBase
    {
        A1 a1;
        A1 a2;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception EDerived extends EBase
    {
        A1 a3;
        A1 a4;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    module Inner
    {
        class A
        {
            ::Test::A theA;
        }
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        exception Ex
        {
            string reason;
        }
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        module Sub
        {
            class A
            {
                ::Test::Inner::A theA;
            }
<<<<<<< HEAD
                
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
            exception Ex
            {
                string reason;
            }
        }
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class Recursive
    {
        Recursive v;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class K
    {
        Value value;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class L
    {
        string data;
    }
<<<<<<< HEAD
        
    sequence<Value> ValueSeq;
    dictionary<string, Value> ValueMap;
        
=======
<<<<<<< Updated upstream

    sequence<Value> ValueSeq;
    dictionary<string, Value> ValueMap;

=======

    sequence<Value> ValueSeq;
    dictionary<string, Value> ValueMap;

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct StructKey
    {
        int i;
        string s;
    }
<<<<<<< HEAD
        
    dictionary<StructKey, L> LMap;
        
=======
<<<<<<< Updated upstream

    dictionary<StructKey, L> LMap;

=======

    dictionary<StructKey, L> LMap;

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class M
    {
        LMap v;
    }
<<<<<<< HEAD
        
    // Forward declarations
    class F1;
    interface F2;
        
=======
<<<<<<< Updated upstream

    // Forward declarations
    class F1;
    interface F2;

=======

    // Forward declarations
    class F1;
    interface F2;

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class F3
    {
        F1 f1;
        F2* f2;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface Initial
    {
        void shutdown();
        B getB1();
        B getB2();
        C getC();
        D getD();
<<<<<<< HEAD
            
        void setRecursive(Recursive p);
            
        void setCycle(Recursive r);
        bool acceptsClassCycles();
            
        ["marshaled-result"] B getMB();
        ["amd"] ["marshaled-result"] B getAMDMB();
            
        void getAll(out B b1, out B b2, out C theC, out D theD);
            
        K getK();
            
        Value opValue(Value v1, out Value v2);
        ValueSeq opValueSeq(ValueSeq v1, out ValueSeq v2);
        ValueMap opValueMap(ValueMap v1, out ValueMap v2);
            
        D1 getD1(D1 d1);
        void throwEDerived() throws EDerived;
            
        void setG(G theG);
            
        BaseSeq opBaseSeq(BaseSeq inSeq, out BaseSeq outSeq);
            
        Compact getCompact();
            
        Inner::A getInnerA();
        Inner::Sub::A getInnerSubA();
            
        void throwInnerEx() throws Inner::Ex;
        void throwInnerSubEx() throws Inner::Sub::Ex;
            
        M opM(M v1, out M v2);
            
=======
<<<<<<< Updated upstream

        void setRecursive(Recursive p);

        void setCycle(Recursive r);
        bool acceptsClassCycles();

        ["marshaled-result"] B getMB();
        ["amd"] ["marshaled-result"] B getAMDMB();

        void getAll(out B b1, out B b2, out C theC, out D theD);

        K getK();

        Value opValue(Value v1, out Value v2);
        ValueSeq opValueSeq(ValueSeq v1, out ValueSeq v2);
        ValueMap opValueMap(ValueMap v1, out ValueMap v2);

        D1 getD1(D1 d1);
        void throwEDerived() throws EDerived;

        void setG(G theG);

        BaseSeq opBaseSeq(BaseSeq inSeq, out BaseSeq outSeq);

        Compact getCompact();

        Inner::A getInnerA();
        Inner::Sub::A getInnerSubA();

        void throwInnerEx() throws Inner::Ex;
        void throwInnerSubEx() throws Inner::Sub::Ex;

        M opM(M v1, out M v2);

=======

        void setRecursive(Recursive p);

        void setCycle(Recursive r);
        bool acceptsClassCycles();

        ["marshaled-result"] B getMB();
        ["amd"] ["marshaled-result"] B getAMDMB();

        void getAll(out B b1, out B b2, out C theC, out D theD);

        K getK();

        Value opValue(Value v1, out Value v2);
        ValueSeq opValueSeq(ValueSeq v1, out ValueSeq v2);
        ValueMap opValueMap(ValueMap v1, out ValueMap v2);

        D1 getD1(D1 d1);
        void throwEDerived() throws EDerived;

        void setG(G theG);

        BaseSeq opBaseSeq(BaseSeq inSeq, out BaseSeq outSeq);

        Compact getCompact();

        Inner::A getInnerA();
        Inner::Sub::A getInnerSubA();

        void throwInnerEx() throws Inner::Ex;
        void throwInnerSubEx() throws Inner::Sub::Ex;

        M opM(M v1, out M v2);

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        F1 opF1(F1 f11, out F1 f12);
        F2* opF2(F2* f21, out F2* f22);
        F3 opF3(F3 f31, out F3 f32);
        bool hasF3();
    }
}
