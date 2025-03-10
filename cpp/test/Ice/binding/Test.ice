// Copyright (c) ZeroC, Inc.
    
#pragma once
    
module Test
{
    interface TestIntf
    {
        string getAdapterName();
    }
<<<<<<< HEAD
        
    interface RemoteObjectAdapter
    {
        TestIntf* getTestIntf();
            
        void deactivate();
    }
        
    interface RemoteCommunicator
    {
        RemoteObjectAdapter* createObjectAdapter(string name, string endpoints);
            
        void deactivateObjectAdapter(RemoteObjectAdapter* adapter);
            
=======
<<<<<<< Updated upstream

    interface RemoteObjectAdapter
    {
        TestIntf* getTestIntf();

        void deactivate();
    }

    interface RemoteCommunicator
    {
        RemoteObjectAdapter* createObjectAdapter(string name, string endpoints);

        void deactivateObjectAdapter(RemoteObjectAdapter* adapter);

=======

    interface RemoteObjectAdapter
    {
        TestIntf* getTestIntf();

        void deactivate();
    }

    interface RemoteCommunicator
    {
        RemoteObjectAdapter* createObjectAdapter(string name, string endpoints);

        void deactivateObjectAdapter(RemoteObjectAdapter* adapter);

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        void shutdown();
    }
}
