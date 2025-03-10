// Copyright (c) ZeroC, Inc.
    
#pragma once
    
["cs:namespace:Ice.servantLocator"]
module Test
{
    exception TestIntfUserException
    {
    }
<<<<<<< HEAD
        
    exception TestImpossibleException
    {
    }
        
=======
<<<<<<< Updated upstream

    exception TestImpossibleException
    {
    }

=======

    exception TestImpossibleException
    {
    }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface TestIntf
    {
        void requestFailedException();
        void unknownUserException();
        void unknownLocalException();
        void unknownException();
        void localException();
        void userException();
        void csException();
<<<<<<< HEAD
            
        void unknownExceptionWithServantException();
            
        string impossibleException(bool shouldThrow) throws TestImpossibleException;
        string intfUserException(bool shouldThrow) throws TestIntfUserException, TestImpossibleException;
            
        void asyncResponse() throws TestIntfUserException, TestImpossibleException;
        void asyncException() throws TestIntfUserException, TestImpossibleException;
            
        void shutdown();
    }
        
=======
<<<<<<< Updated upstream

        void unknownExceptionWithServantException();

        string impossibleException(bool shouldThrow) throws TestImpossibleException;
        string intfUserException(bool shouldThrow) throws TestIntfUserException, TestImpossibleException;

        void asyncResponse() throws TestIntfUserException, TestImpossibleException;
        void asyncException() throws TestIntfUserException, TestImpossibleException;

        void shutdown();
    }

=======

        void unknownExceptionWithServantException();

        string impossibleException(bool shouldThrow) throws TestImpossibleException;
        string intfUserException(bool shouldThrow) throws TestIntfUserException, TestImpossibleException;

        void asyncResponse() throws TestIntfUserException, TestImpossibleException;
        void asyncException() throws TestIntfUserException, TestImpossibleException;

        void shutdown();
    }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface TestActivation
    {
        void activateServantLocator(bool activate);
    }
}
