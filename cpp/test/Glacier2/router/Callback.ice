// Copyright (c) ZeroC, Inc.
    
#pragma once
    
#include "Ice/BuiltinSequences.ice"
    
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
            
        ["amd"] int concurrentCallback(int number);
            
        void waitCallback();
            
        void callbackWithPayload(Ice::ByteSeq payload);
    }
        
    interface Callback
    {
        ["amd"] void initiateCallback(CallbackReceiver* proxy);
            
        ["amd"] void initiateCallbackEx(CallbackReceiver* proxy)
            throws CallbackException;
            
        ["amd"] int initiateConcurrentCallback(int number, CallbackReceiver* proxy);
            
        ["amd"] void initiateWaitCallback(CallbackReceiver* proxy);
            
        ["amd"] void initiateCallbackWithPayload(CallbackReceiver* proxy);
            
=======
<<<<<<< Updated upstream

    interface CallbackReceiver
    {
        void callback();

        void callbackEx()
        throws CallbackException;

        ["amd"] int concurrentCallback(int number);

        void waitCallback();

        void callbackWithPayload(Ice::ByteSeq payload);
    }

    interface Callback
    {
        ["amd"] void initiateCallback(CallbackReceiver* proxy);

        ["amd"] void initiateCallbackEx(CallbackReceiver* proxy)
        throws CallbackException;

        ["amd"] int initiateConcurrentCallback(int number, CallbackReceiver* proxy);

        ["amd"] void initiateWaitCallback(CallbackReceiver* proxy);

        ["amd"] void initiateCallbackWithPayload(CallbackReceiver* proxy);

=======

    interface CallbackReceiver
    {
        void callback();

        void callbackEx()
            throws CallbackException;

        ["amd"] int concurrentCallback(int number);

        void waitCallback();

        void callbackWithPayload(Ice::ByteSeq payload);
    }

    interface Callback
    {
        ["amd"] void initiateCallback(CallbackReceiver* proxy);

        ["amd"] void initiateCallbackEx(CallbackReceiver* proxy)
            throws CallbackException;

        ["amd"] int initiateConcurrentCallback(int number, CallbackReceiver* proxy);

        ["amd"] void initiateWaitCallback(CallbackReceiver* proxy);

        ["amd"] void initiateCallbackWithPayload(CallbackReceiver* proxy);

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        void shutdown();
    }
}
