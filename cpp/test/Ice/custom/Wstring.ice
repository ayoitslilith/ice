// Copyright (c) ZeroC, Inc.
    
#pragma once
    
["cpp:type:wstring"] module Test1
{
    sequence<string> WstringSeq;
<<<<<<< HEAD
        
    dictionary<string, string> WstringWStringDict;
        
=======
<<<<<<< Updated upstream

    dictionary<string, string> WstringWStringDict;

=======

    dictionary<string, string> WstringWStringDict;

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct WstringStruct
    {
        string s;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception WstringException
    {
        string reason;
    }
<<<<<<< HEAD
        
    interface WstringClass
    {
        string opString(string s1, out string s2);
            
        WstringStruct opStruct(WstringStruct s1, out WstringStruct s2);
            
        void throwExcept(string reason)
            throws WstringException;
    }
}
    
module Test2
{
    sequence<["cpp:type:wstring"] string> WstringSeq;
        
    dictionary<["cpp:type:wstring"] string, ["cpp:type:wstring"] string> WstringWStringDict;
        
=======
<<<<<<< Updated upstream

    interface WstringClass
    {
        string opString(string s1, out string s2);

        WstringStruct opStruct(WstringStruct s1, out WstringStruct s2);

        void throwExcept(string reason)
        throws WstringException;
    }
}

module Test2
{
    sequence<["cpp:type:wstring"] string> WstringSeq;

    dictionary<["cpp:type:wstring"] string, ["cpp:type:wstring"] string> WstringWStringDict;

=======

    interface WstringClass
    {
        string opString(string s1, out string s2);

        WstringStruct opStruct(WstringStruct s1, out WstringStruct s2);

        void throwExcept(string reason)
            throws WstringException;
    }
}

module Test2
{
    sequence<["cpp:type:wstring"] string> WstringSeq;

    dictionary<["cpp:type:wstring"] string, ["cpp:type:wstring"] string> WstringWStringDict;

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    ["cpp:type:wstring"] struct WstringStruct
    {
        string s;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    ["cpp:type:wstring"] exception WstringException
    {
        string reason;
    }
<<<<<<< HEAD
        
    ["cpp:type:wstring"] interface WstringClass
    {
        string opString(string s1, out string s2);
            
        WstringStruct opStruct(WstringStruct s1, out WstringStruct s2);
            
        void throwExcept(string reason)
            throws WstringException;
=======
<<<<<<< Updated upstream

    ["cpp:type:wstring"] interface WstringClass
    {
        string opString(string s1, out string s2);

        WstringStruct opStruct(WstringStruct s1, out WstringStruct s2);

        void throwExcept(string reason)
        throws WstringException;
=======

    ["cpp:type:wstring"] interface WstringClass
    {
        string opString(string s1, out string s2);

        WstringStruct opStruct(WstringStruct s1, out WstringStruct s2);

        void throwExcept(string reason)
            throws WstringException;
>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    }
}
