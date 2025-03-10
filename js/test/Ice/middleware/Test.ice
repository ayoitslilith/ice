// Copyright (c) ZeroC, Inc.
    
#pragma once
    
module Test
{
    interface Echo
    {
        void setConnection();
        void startBatch();
        void flushBatch();
        void shutdown();
        bool supportsCompress();
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface MyObject
    {
        string getName();
        void shutdown();
    }
}
