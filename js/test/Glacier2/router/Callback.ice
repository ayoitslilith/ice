// Copyright (c) ZeroC, Inc.
    
#pragma once
    
module Test
{
    exception CallbackException
    {
        double someValue;
        string someString;
    }
<<<<<<< HEAD
        
    interface CallbackReceiver
    {
        void callback();
            
        void callbackEx()
            throws CallbackException;
    }
        
    interface Callback
    {
        void initiateCallback(CallbackReceiver* proxy);
            
        void initiateCallbackEx(CallbackReceiver* proxy)
            throws CallbackException;
            
=======
<<<<<<< Updated upstream

    interface CallbackReceiver
    {
        void callback();

        void callbackEx()
        throws CallbackException;
    }

    interface Callback
    {
        void initiateCallback(CallbackReceiver* proxy);

        void initiateCallbackEx(CallbackReceiver* proxy)
        throws CallbackException;

=======

    interface CallbackReceiver
    {
        void callback();

        void callbackEx()
            throws CallbackException;
    }

    interface Callback
    {
        void initiateCallback(CallbackReceiver* proxy);

        void initiateCallbackEx(CallbackReceiver* proxy)
            throws CallbackException;

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        void shutdown();
    }
}
