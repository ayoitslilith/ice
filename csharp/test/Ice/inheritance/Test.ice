// Copyright (c) ZeroC, Inc.
    
#pragma once
    
["cs:namespace:Ice.inheritance"]
module Test
{
    module MA
    {
        interface IA
        {
            IA* iaop(IA* p);
        }
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    module MB
    {
        interface IB1 extends MA::IA
        {
            IB1* ib1op(IB1* p);
        }
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        interface IB2 extends MA::IA
        {
            IB2* ib2op(IB2* p);
        }
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    module MA
    {
        interface IC extends MB::IB1, MB::IB2
        {
            IC* icop(IC* p);
        }
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface Initial
    {
        void shutdown();
        MA::IA* iaop();
        MB::IB1* ib1op();
        MB::IB2* ib2op();
        MA::IC* icop();
    }
}
