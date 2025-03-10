// Copyright (c) ZeroC, Inc.
    
#pragma once
    
module Test
{
    exception BadEncodingException {}
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface MyObject
    {
        ["cpp:type:wstring"] string widen(string msg) throws BadEncodingException;
        string narrow(["cpp:type:wstring"] string wmsg);
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        void shutdown();
    }
}
