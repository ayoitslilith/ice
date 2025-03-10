// Copyright (c) ZeroC, Inc.
    
#pragma once
    
#include "Ice/Context.ice"
    
["cs:namespace:Ice.proxy.AMD"]
module Test
{
    ["amd"] interface MyClass
    {
        void shutdown();
<<<<<<< HEAD
            
        Ice::Context getContext();
    }
        
=======
<<<<<<< Updated upstream

        Ice::Context getContext();
    }

=======

        Ice::Context getContext();
    }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    ["amd"] interface MyDerivedClass extends MyClass
    {
        Object* echo(Object* obj);
    }
}
