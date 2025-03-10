// Copyright (c) ZeroC, Inc.
#pragma once
    
#include "Ice/Context.ice"
    
module Test
{
    interface TestIntf
    {
        void shutdown();
<<<<<<< HEAD
            
        Ice::Context getEndpointInfoAsContext();
            
=======
<<<<<<< Updated upstream

        Ice::Context getEndpointInfoAsContext();

=======

        Ice::Context getEndpointInfoAsContext();

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        Ice::Context getConnectionInfoAsContext();
    }
}
