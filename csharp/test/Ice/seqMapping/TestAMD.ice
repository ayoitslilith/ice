// Copyright (c) ZeroC, Inc.
    
#pragma once
    
["cs:namespace:Ice.seqMapping.AMD"]
module Test
{
    sequence<byte> AByteS;
    ["cs:generic:List"] sequence<byte> LByteS;
    ["cs:generic:LinkedList"] sequence<byte> KByteS;
    ["cs:generic:Queue"] sequence<byte> QByteS;
    ["cs:generic:Stack"] sequence<byte> SByteS;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    sequence<bool> ABoolS;
    ["cs:generic:List"] sequence<bool> LBoolS;
    ["cs:generic:LinkedList"] sequence<bool> KBoolS;
    ["cs:generic:Queue"] sequence<bool> QBoolS;
    ["cs:generic:Stack"] sequence<bool> SBoolS;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    sequence<short> AShortS;
    ["cs:generic:List"] sequence<short> LShortS;
    ["cs:generic:LinkedList"] sequence<short> KShortS;
    ["cs:generic:Queue"] sequence<short> QShortS;
    ["cs:generic:Stack"] sequence<short> SShortS;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    sequence<int> AIntS;
    ["cs:generic:List"] sequence<int> LIntS;
    ["cs:generic:LinkedList"] sequence<int> KIntS;
    ["cs:generic:Queue"] sequence<int> QIntS;
    ["cs:generic:Stack"] sequence<int> SIntS;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    sequence<long> ALongS;
    ["cs:generic:List"] sequence<long> LLongS;
    ["cs:generic:LinkedList"] sequence<long> KLongS;
    ["cs:generic:Queue"] sequence<long> QLongS;
    ["cs:generic:Stack"] sequence<long> SLongS;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    sequence<float> AFloatS;
    ["cs:generic:List"] sequence<float> LFloatS;
    ["cs:generic:LinkedList"] sequence<float> KFloatS;
    ["cs:generic:Queue"] sequence<float> QFloatS;
    ["cs:generic:Stack"] sequence<float> SFloatS;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    sequence<double> ADoubleS;
    ["cs:generic:List"] sequence<double> LDoubleS;
    ["cs:generic:LinkedList"] sequence<double> KDoubleS;
    ["cs:generic:Queue"] sequence<double> QDoubleS;
    ["cs:generic:Stack"] sequence<double> SDoubleS;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    sequence<string> AStringS;
    ["cs:generic:List"] sequence<string> LStringS;
    ["cs:generic:LinkedList"] sequence<string> KStringS;
    ["cs:generic:Queue"] sequence<string> QStringS;
    ["cs:generic:Stack"] sequence<string> SStringS;
<<<<<<< HEAD
        
    sequence<Object> AObjectS;
    ["cs:generic:List"] sequence<Object> LObjectS;
        
=======
<<<<<<< Updated upstream

    sequence<Object> AObjectS;
    ["cs:generic:List"] sequence<Object> LObjectS;

=======

    sequence<Object> AObjectS;
    ["cs:generic:List"] sequence<Object> LObjectS;

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    sequence<Object*> AObjectPrxS;
    ["cs:generic:List"] sequence<Object*> LObjectPrxS;
    ["cs:generic:LinkedList"] sequence<Object*> KObjectPrxS;
    ["cs:generic:Queue"] sequence<Object*> QObjectPrxS;
    ["cs:generic:Stack"] sequence<Object*> SObjectPrxS;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct S
    {
        int i;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    sequence<S> AStructS;
    ["cs:generic:List"] sequence<S> LStructS;
    ["cs:generic:LinkedList"] sequence<S> KStructS;
    ["cs:generic:Queue"] sequence<S> QStructS;
    ["cs:generic:Stack"] sequence<S> SStructS;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct SD
    {
        int i = 1;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    sequence<SD> AStructSD;
    ["cs:generic:List"] sequence<SD> LStructSD;
    ["cs:generic:LinkedList"] sequence<SD> KStructSD;
    ["cs:generic:Queue"] sequence<SD> QStructSD;
    ["cs:generic:Stack"] sequence<SD> SStructSD;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class CV
    {
        int i;
    }
<<<<<<< HEAD
        
    sequence<CV> ACVS;
    ["cs:generic:List"] sequence<CV> LCVS;
        
=======
<<<<<<< Updated upstream

    sequence<CV> ACVS;
    ["cs:generic:List"] sequence<CV> LCVS;
=======

    sequence<CV> ACVS;
    ["cs:generic:List"] sequence<CV> LCVS;

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface I {}
    sequence<I*> AIPrxS;
    ["cs:generic:List"] sequence<I*> LIPrxS;
    ["cs:generic:LinkedList"] sequence<I*> KIPrxS;
    ["cs:generic:Queue"] sequence<I*> QIPrxS;
    ["cs:generic:Stack"] sequence<I*> SIPrxS;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class CR
    {
        CV v;
    }
<<<<<<< HEAD
        
    sequence<CR> ACRS;
    ["cs:generic:List"] sequence<CR> LCRS;
        
    enum En { A, B, C }
        
=======
<<<<<<< Updated upstream

    sequence<CR> ACRS;
    ["cs:generic:List"] sequence<CR> LCRS;
    enum En { A, B, C }
=======

    sequence<CR> ACRS;
    ["cs:generic:List"] sequence<CR> LCRS;

    enum En { A, B, C }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    sequence<En> AEnS;
    ["cs:generic:List"] sequence<En> LEnS;
    ["cs:generic:LinkedList"] sequence<En> KEnS;
    ["cs:generic:Queue"] sequence<En> QEnS;
    ["cs:generic:Stack"] sequence<En> SEnS;
<<<<<<< HEAD
        
    ["cs:generic:Ice.seqMapping.Custom"] sequence<int> CustomIntS;
    ["cs:generic:Ice.seqMapping.Custom"] sequence<CV> CustomCVS;
        
    ["cs:generic:Ice.seqMapping.Custom"] sequence<CustomIntS> CustomIntSS;
    ["cs:generic:Ice.seqMapping.Custom"] sequence<CustomCVS> CustomCVSS;
        
    ["amd"] interface MyClass
    {
        void shutdown();
            
=======
<<<<<<< Updated upstream

    ["cs:generic:Ice.seqMapping.Custom"] sequence<int> CustomIntS;
    ["cs:generic:Ice.seqMapping.Custom"] sequence<CV> CustomCVS;

    ["cs:generic:Ice.seqMapping.Custom"] sequence<CustomIntS> CustomIntSS;
    ["cs:generic:Ice.seqMapping.Custom"] sequence<CustomCVS> CustomCVSS;

    ["amd"] interface MyClass
    {
        void shutdown();

=======

    ["cs:generic:Ice.seqMapping.Custom"] sequence<int> CustomIntS;
    ["cs:generic:Ice.seqMapping.Custom"] sequence<CV> CustomCVS;

    ["cs:generic:Ice.seqMapping.Custom"] sequence<CustomIntS> CustomIntSS;
    ["cs:generic:Ice.seqMapping.Custom"] sequence<CustomCVS> CustomCVSS;

    ["amd"] interface MyClass
    {
        void shutdown();

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        AByteS opAByteS(AByteS i, out AByteS o);
        LByteS opLByteS(LByteS i, out LByteS o);
        KByteS opKByteS(KByteS i, out KByteS o);
        QByteS opQByteS(QByteS i, out QByteS o);
        SByteS opSByteS(SByteS i, out SByteS o);
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        ABoolS opABoolS(ABoolS i, out ABoolS o);
        LBoolS opLBoolS(LBoolS i, out LBoolS o);
        KBoolS opKBoolS(KBoolS i, out KBoolS o);
        QBoolS opQBoolS(QBoolS i, out QBoolS o);
        SBoolS opSBoolS(SBoolS i, out SBoolS o);
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        AShortS opAShortS(AShortS i, out AShortS o);
        LShortS opLShortS(LShortS i, out LShortS o);
        KShortS opKShortS(KShortS i, out KShortS o);
        QShortS opQShortS(QShortS i, out QShortS o);
        SShortS opSShortS(SShortS i, out SShortS o);
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        AIntS opAIntS(AIntS i, out AIntS o);
        LIntS opLIntS(LIntS i, out LIntS o);
        KIntS opKIntS(KIntS i, out KIntS o);
        QIntS opQIntS(QIntS i, out QIntS o);
        SIntS opSIntS(SIntS i, out SIntS o);
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        ALongS opALongS(ALongS i, out ALongS o);
        LLongS opLLongS(LLongS i, out LLongS o);
        KLongS opKLongS(KLongS i, out KLongS o);
        QLongS opQLongS(QLongS i, out QLongS o);
        SLongS opSLongS(SLongS i, out SLongS o);
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        AFloatS opAFloatS(AFloatS i, out AFloatS o);
        LFloatS opLFloatS(LFloatS i, out LFloatS o);
        KFloatS opKFloatS(KFloatS i, out KFloatS o);
        QFloatS opQFloatS(QFloatS i, out QFloatS o);
        SFloatS opSFloatS(SFloatS i, out SFloatS o);
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        ADoubleS opADoubleS(ADoubleS i, out ADoubleS o);
        LDoubleS opLDoubleS(LDoubleS i, out LDoubleS o);
        KDoubleS opKDoubleS(KDoubleS i, out KDoubleS o);
        QDoubleS opQDoubleS(QDoubleS i, out QDoubleS o);
        SDoubleS opSDoubleS(SDoubleS i, out SDoubleS o);
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        AStringS opAStringS(AStringS i, out AStringS o);
        LStringS opLStringS(LStringS i, out LStringS o);
        KStringS opKStringS(KStringS i, out KStringS o);
        QStringS opQStringS(QStringS i, out QStringS o);
        SStringS opSStringS(SStringS i, out SStringS o);
<<<<<<< HEAD
            
        AObjectS opAObjectS(AObjectS i, out AObjectS o);
        LObjectS opLObjectS(LObjectS i, out LObjectS o);
            
=======
<<<<<<< Updated upstream

        AObjectS opAObjectS(AObjectS i, out AObjectS o);
        LObjectS opLObjectS(LObjectS i, out LObjectS o);

=======

        AObjectS opAObjectS(AObjectS i, out AObjectS o);
        LObjectS opLObjectS(LObjectS i, out LObjectS o);

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        AObjectPrxS opAObjectPrxS(AObjectPrxS i, out AObjectPrxS o);
        LObjectPrxS opLObjectPrxS(LObjectPrxS i, out LObjectPrxS o);
        KObjectPrxS opKObjectPrxS(KObjectPrxS i, out KObjectPrxS o);
        QObjectPrxS opQObjectPrxS(QObjectPrxS i, out QObjectPrxS o);
        SObjectPrxS opSObjectPrxS(SObjectPrxS i, out SObjectPrxS o);
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        AStructS opAStructS(AStructS i, out AStructS o);
        LStructS opLStructS(LStructS i, out LStructS o);
        KStructS opKStructS(KStructS i, out KStructS o);
        QStructS opQStructS(QStructS i, out QStructS o);
        SStructS opSStructS(SStructS i, out SStructS o);
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        AStructSD opAStructSD(AStructSD i, out AStructSD o);
        LStructSD opLStructSD(LStructSD i, out LStructSD o);
        KStructSD opKStructSD(KStructSD i, out KStructSD o);
        QStructSD opQStructSD(QStructSD i, out QStructSD o);
        SStructSD opSStructSD(SStructSD i, out SStructSD o);
<<<<<<< HEAD
            
        ACVS opACVS(ACVS i, out ACVS o);
        LCVS opLCVS(LCVS i, out LCVS o);
            
        ACRS opACRS(ACRS i, out ACRS o);
        LCRS opLCRS(LCRS i, out LCRS o);
            
=======
<<<<<<< Updated upstream

        ACVS opACVS(ACVS i, out ACVS o);
        LCVS opLCVS(LCVS i, out LCVS o);

        ACRS opACRS(ACRS i, out ACRS o);
        LCRS opLCRS(LCRS i, out LCRS o);

=======

        ACVS opACVS(ACVS i, out ACVS o);
        LCVS opLCVS(LCVS i, out LCVS o);

        ACRS opACRS(ACRS i, out ACRS o);
        LCRS opLCRS(LCRS i, out LCRS o);

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        AEnS opAEnS(AEnS i, out AEnS o);
        LEnS opLEnS(LEnS i, out LEnS o);
        KEnS opKEnS(KEnS i, out KEnS o);
        QEnS opQEnS(QEnS i, out QEnS o);
        SEnS opSEnS(SEnS i, out SEnS o);
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        AIPrxS opAIPrxS(AIPrxS i, out AIPrxS o);
        LIPrxS opLIPrxS(LIPrxS i, out LIPrxS o);
        KIPrxS opKIPrxS(KIPrxS i, out KIPrxS o);
        QIPrxS opQIPrxS(QIPrxS i, out QIPrxS o);
        SIPrxS opSIPrxS(SIPrxS i, out SIPrxS o);
<<<<<<< HEAD
            
        CustomIntS opCustomIntS(CustomIntS i, out CustomIntS o);
        CustomCVS opCustomCVS(CustomCVS i, out CustomCVS o);
            
=======
<<<<<<< Updated upstream

        CustomIntS opCustomIntS(CustomIntS i, out CustomIntS o);
        CustomCVS opCustomCVS(CustomCVS i, out CustomCVS o);

=======

        CustomIntS opCustomIntS(CustomIntS i, out CustomIntS o);
        CustomCVS opCustomCVS(CustomCVS i, out CustomCVS o);

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        CustomIntSS opCustomIntSS(CustomIntSS i, out CustomIntSS o);
        CustomCVSS opCustomCVSS(CustomCVSS i, out CustomCVSS o);
    }
}
