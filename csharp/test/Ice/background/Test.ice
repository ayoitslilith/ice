// Copyright (c) ZeroC, Inc.
    
#pragma once
    
#include "Ice/BuiltinSequences.ice"
    
module Test
{
    interface Background
    {
        void op();
        void opWithPayload(Ice::ByteSeq seq);
<<<<<<< HEAD
            
        void shutdown();
    }
        
=======
<<<<<<< Updated upstream

        void shutdown();
    }

=======

        void shutdown();
    }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface BackgroundController
    {
        void pauseCall(string call);
        void resumeCall(string call);
<<<<<<< HEAD
            
        void holdAdapter();
        void resumeAdapter();
            
        void initializeException(bool enable);
            
        void readReady(bool enable);
        void readException(bool enable);
            
        void writeReady(bool enable);
        void writeException(bool enable);
            
=======
<<<<<<< Updated upstream

        void holdAdapter();
        void resumeAdapter();

        void initializeException(bool enable);

        void readReady(bool enable);
        void readException(bool enable);

        void writeReady(bool enable);
        void writeException(bool enable);

=======

        void holdAdapter();
        void resumeAdapter();

        void initializeException(bool enable);

        void readReady(bool enable);
        void readException(bool enable);

        void writeReady(bool enable);
        void writeException(bool enable);

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        void buffered(bool enable);
    }
}
