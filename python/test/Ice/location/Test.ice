// Copyright (c) ZeroC, Inc.
    
#pragma once
    
#include "Ice/Locator.ice"
    
module Test
{
    interface TestLocatorRegistry extends ::Ice::LocatorRegistry
    {
        //
        // Allow remote addition of objects to the locator registry.
        //
        void addObject(Object* obj);
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface TestLocator extends ::Ice::Locator
    {
        //
        // Returns the number of request on the locator interface.
        //
        idempotent int getRequestCount();
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface ServerManager
    {
        void startServer();
        void shutdown();
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface Hello
    {
        void sayHello();
    }
<<<<<<< HEAD
        
    interface TestIntf
    {
        void shutdown();
            
        Hello* getHello();
            
        Hello* getReplicatedHello();
            
=======
<<<<<<< Updated upstream

    interface TestIntf
    {
        void shutdown();

        Hello* getHello();

        Hello* getReplicatedHello();

=======

    interface TestIntf
    {
        void shutdown();

        Hello* getHello();

        Hello* getReplicatedHello();

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        void migrateHello();
    }
}
