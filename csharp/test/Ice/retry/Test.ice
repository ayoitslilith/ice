// Copyright (c) ZeroC, Inc.
    
#pragma once
    
["cs:namespace:Ice.retry"]
module Test
{
    interface Retry
    {
        void op(bool kill);
<<<<<<< HEAD
            
        idempotent int opIdempotent(int c);
        void opNotIdempotent();
            
        idempotent void sleep(int delay);
            
=======
<<<<<<< Updated upstream

        idempotent int opIdempotent(int c);
        void opNotIdempotent();

        idempotent void sleep(int delay);

=======

        idempotent int opIdempotent(int c);
        void opNotIdempotent();

        idempotent void sleep(int delay);

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        idempotent void shutdown();
    }
}
