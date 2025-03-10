// Copyright (c) ZeroC, Inc.
    
#pragma once
    
#include "Glacier2/Session.ice"
    
module Test
{
    interface Session extends Glacier2::Session
    {
        ["amd"] void destroyFromClient();
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        void shutdown();
    }
}
