// Copyright (c) ZeroC, Inc.
    
#pragma once
    
#include "Ice/Context.ice"
#include "Ice/Identity.ice"
    
module Test
{
    interface TestIntf
    {
        string getAdapterName();
        string getConnection();
        Ice::Identity getIdentity();
        string getFacet();
        string getOperation();
        string getMode();
        Ice::Context getContext();
        int getRequestId();
        string getEncoding();
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        void shutdown();
    }
}
