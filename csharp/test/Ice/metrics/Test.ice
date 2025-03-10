// Copyright (c) ZeroC, Inc.
    
#pragma once
    
module Test
{
    exception UserEx
    {
    }
<<<<<<< HEAD
        
    sequence<byte> ByteSeq;
        
    interface Metrics
    {
        void op();
            
        idempotent void fail();
            
        void opWithUserException()
            throws UserEx;
            
        void opWithRequestFailedException();
            
        void opWithLocalException();
            
        void opWithUnknownException();
            
        void opByteS(ByteSeq bs);
            
        Object* getAdmin();
            
        void shutdown();
    }
        
    interface Controller
    {
        void hold();
            
=======
<<<<<<< Updated upstream

    sequence<byte> ByteSeq;

    interface Metrics
    {
        void op();

        idempotent void fail();

        void opWithUserException()
        throws UserEx;

        void opWithRequestFailedException();

        void opWithLocalException();

        void opWithUnknownException();

        void opByteS(ByteSeq bs);

        Object* getAdmin();

        void shutdown();
    }

    interface Controller
    {
        void hold();

=======

    sequence<byte> ByteSeq;

    interface Metrics
    {
        void op();

        idempotent void fail();

        void opWithUserException()
            throws UserEx;

        void opWithRequestFailedException();

        void opWithLocalException();

        void opWithUnknownException();

        void opByteS(ByteSeq bs);

        Object* getAdmin();

        void shutdown();
    }

    interface Controller
    {
        void hold();

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        void resume();
    }
}
