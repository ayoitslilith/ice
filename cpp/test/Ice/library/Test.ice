// Copyright (c) ZeroC, Inc.
    
#pragma once
    
[["cpp:dll-export:LIBRARY_TEST_API"]]
    
module Test
{
    exception UserError
    {
        string message;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface MyInterface
    {
        void op(bool throwIt) throws UserError;
    }
}
