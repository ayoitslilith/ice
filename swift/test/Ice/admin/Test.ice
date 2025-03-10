// Copyright (c) ZeroC, Inc.
#ifndef TEST_ICE
#define TEST_ICE
    
#include "Ice/PropertyDict.ice"
    
module Test
{
    interface RemoteCommunicator
    {
        Object* getAdmin();
<<<<<<< HEAD
            
        Ice::PropertyDict getChanges();
            
=======
<<<<<<< Updated upstream

        Ice::PropertyDict getChanges();

=======

        Ice::PropertyDict getChanges();

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        //
        // Logger operations
        //
        void print(string message);
        void trace(string category, string message);
        void warning(string message);
        void error(string message);
<<<<<<< HEAD
            
        void shutdown();
            
        void waitForShutdown();
            
        void destroy();
    }
        
    interface RemoteCommunicatorFactory
    {
        RemoteCommunicator* createCommunicator(Ice::PropertyDict props);
            
        void shutdown();
    }
        
=======
<<<<<<< Updated upstream

        void shutdown();

        void waitForShutdown();

        void destroy();
    }

    interface RemoteCommunicatorFactory
    {
        RemoteCommunicator* createCommunicator(Ice::PropertyDict props);

        void shutdown();
    }

=======

        void shutdown();

        void waitForShutdown();

        void destroy();
    }

    interface RemoteCommunicatorFactory
    {
        RemoteCommunicator* createCommunicator(Ice::PropertyDict props);

        void shutdown();
    }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface TestFacet
    {
        void op();
    }
}
<<<<<<< HEAD
    
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
#endif
