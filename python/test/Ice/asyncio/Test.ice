// Copyright (c) ZeroC, Inc.
    
#pragma once
    
module Test
{
    exception TestException
    {
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface TestIntf
    {
        int op();
        int callOpOn(TestIntf* proxy);
        void throwUserException1() throws TestException;
        void throwUserException2() throws TestException;
        void throwUnhandledException1();
        void throwUnhandledException2();
        void sleep(int ms);
        void shutdown();
    }
}
