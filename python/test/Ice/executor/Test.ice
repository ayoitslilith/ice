// Copyright (c) ZeroC, Inc.
    
#pragma once
    
#include "Ice/BuiltinSequences.ice"
    
module Test
{
    interface TestIntf
    {
        void op();
        void sleep(int to);
        void opWithPayload(Ice::ByteSeq seq);
        void shutdown();
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface TestIntfController
    {
        void holdAdapter();
        void resumeAdapter();
    }
}
