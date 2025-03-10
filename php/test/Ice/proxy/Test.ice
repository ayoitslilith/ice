// Copyright (c) ZeroC, Inc.
    
#pragma once
    
module Test
{
    dictionary<string, string> Context;
<<<<<<< HEAD
        
    interface MyClass
    {
        void shutdown();
            
        Context getContext();
    }
        
=======
<<<<<<< Updated upstream

    interface MyClass
    {
        void shutdown();

        Context getContext();
    }

=======

    interface MyClass
    {
        void shutdown();

        Context getContext();
    }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface MyDerivedClass extends MyClass
    {
        Object* echo(Object* obj);
    }
}
