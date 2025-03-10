// Copyright (c) ZeroC, Inc.
    
#ifndef TEST_ICE
#define TEST_ICE
    
#include "Ice/PropertyDict.ice"
    
module Test
{
    interface TestIntf
    {
        void sleep(int ms);
    }
<<<<<<< HEAD
        
    interface RemoteCommunicator
    {
        TestIntf* getObject();
            
        int getThreadStartCount();
        int getThreadStopCount();
            
        void destroy();
    }
        
    interface RemoteCommunicatorFactory
    {
        RemoteCommunicator* createCommunicator(Ice::PropertyDict props);
            
        void shutdown();
    }
}
    
=======
<<<<<<< Updated upstream

    interface RemoteCommunicator
    {
        TestIntf* getObject();

        int getThreadStartCount();
        int getThreadStopCount();

        void destroy();
    }

    interface RemoteCommunicatorFactory
    {
        RemoteCommunicator* createCommunicator(Ice::PropertyDict props);

        void shutdown();
    }
}

=======

    interface RemoteCommunicator
    {
        TestIntf* getObject();

        int getThreadStartCount();
        int getThreadStopCount();

        void destroy();
    }

    interface RemoteCommunicatorFactory
    {
        RemoteCommunicator* createCommunicator(Ice::PropertyDict props);

        void shutdown();
    }
}

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
#endif
