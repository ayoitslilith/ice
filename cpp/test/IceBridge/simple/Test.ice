// Copyright (c) ZeroC, Inc.
    
#pragma once
    
module Test
{
    interface Callback
    {
        void ping();
        int getCount();
<<<<<<< HEAD
            
        void datagram();
        int getDatagramCount();
    }
        
=======
<<<<<<< Updated upstream

        void datagram();
        int getDatagramCount();
    }

=======

        void datagram();
        int getDatagramCount();
    }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface MyClass
    {
        ["amd"] void callCallback();
        ["amd"] int getCallbackCount();
<<<<<<< HEAD
            
        void incCounter(int expected);
        void waitCounter(int value);
            
        int getConnectionCount();
        string getConnectionInfo();
        void closeConnection(bool force);
            
        void datagram();
        int getDatagramCount();
            
        void callDatagramCallback();
        ["amd"] int getCallbackDatagramCount();
            
=======
<<<<<<< Updated upstream

        void incCounter(int expected);
        void waitCounter(int value);

        int getConnectionCount();
        string getConnectionInfo();
        void closeConnection(bool force);

        void datagram();
        int getDatagramCount();

        void callDatagramCallback();
        ["amd"] int getCallbackDatagramCount();

=======

        void incCounter(int expected);
        void waitCounter(int value);

        int getConnectionCount();
        string getConnectionInfo();
        void closeConnection(bool force);

        void datagram();
        int getDatagramCount();

        void callDatagramCallback();
        ["amd"] int getCallbackDatagramCount();

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        void shutdown();
    }
}
