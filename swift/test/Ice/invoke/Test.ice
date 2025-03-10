// Copyright (c) ZeroC, Inc.
#pragma once
    
[["swift:class-resolver-prefix:IceInvoke"]]
    
module Test
{
    exception MyException
    {
    }
<<<<<<< HEAD
        
    interface MyClass
    {
        void opOneway();
            
        string opString(string s1, out string s2);
            
        void opException() throws MyException;
            
=======
<<<<<<< Updated upstream

    interface MyClass
    {
        void opOneway();

        string opString(string s1, out string s2);

        void opException() throws MyException;

=======

    interface MyClass
    {
        void opOneway();

        string opString(string s1, out string s2);

        void opException() throws MyException;

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        void shutdown();
    }
}
