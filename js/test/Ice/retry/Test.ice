// Copyright (c) ZeroC, Inc.
    
#pragma once
    
module Test
{
    interface Retry
    {
        void op(bool kill);
<<<<<<< HEAD
            
        idempotent int opIdempotent(int c);
        void opNotIdempotent();
            
=======
<<<<<<< Updated upstream

        idempotent int opIdempotent(int c);
        void opNotIdempotent();

=======

        idempotent int opIdempotent(int c);
        void opNotIdempotent();

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        idempotent void shutdown();
    }
}
