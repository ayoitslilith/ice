// Copyright (c) ZeroC, Inc.
    
#pragma once
    
module Test
{
    exception UE
    {
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface Hello
    {
        void sayHello(int delay);
        int add(int s1, int s2);
        void raiseUE()
<<<<<<< HEAD
            throws UE;
=======
<<<<<<< Updated upstream
        throws UE;
=======
            throws UE;
>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        void shutdown();
    }
}
