// Copyright (c) ZeroC, Inc.
    
#pragma once
    
module Test
{
    sequence<byte> ByteSeq;
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface Timeout
    {
        void op();
        void sendData(ByteSeq seq);
        void sleep(int to);
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface Controller
    {
        void holdAdapter(int to);
        void resumeAdapter();
        void shutdown();
    }
}
