// Copyright (c) ZeroC, Inc.
    
#pragma once
<<<<<<< HEAD
    
module classdef::break // Should be escaped
{
    enum bitand // Should not be escaped
    {
=======
<<<<<<< Updated upstream

module classdef::break // Should be escaped
=======

module classdef // Should be escaped
>>>>>>> Stashed changes
{
    enum bitand // Should not be escaped
    {
<<<<<<< Updated upstream
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        //
        // All of the keywords.
        //
        break, case, catch, classdef, continue, else, elseif, end, enumeration, events, for, function, global,
        if, methods, otherwise, parfor, persistent, properties, return, spmd, switch, try, while,
        //
        // Plus a few method names reserved for enumerators because the enumeration class derives from uint8
        // or int32.
        //
        abs, and, char, eq, length, size, xor,
        LAST
<<<<<<< HEAD
    }
        
=======
=======
        enum bitand // Should not be escaped
        {
            //
            // All of the keywords.
            //
            break, case, catch, classdef, continue, else, elseif, end, enumeration, events, for, function, global,
            if, methods, otherwise, parfor, persistent, properties, return, spmd, switch, try, while,
            //
            // Plus a few method names reserved for enumerators because the enumeration class derives from uint8
            // or int32.
            //
            abs, and, char, eq, length, size, xor,
            LAST
        }

        struct bitor // Should not be escaped
        {
            bitand case = catch;
            int continue = 1;
            int eq = 2;
            int ne = 3;
        }

        class logical // Should not be escaped
        {
            bitand else = enumeration;
            bitor for;
            bool int64 = true; // Should not be escaped
        }

        class xor extends logical // Should not be escaped
        {
            int return = 1;
        }

        sequence<bitor> parfor;
        dictionary<int, bitor> switch;

        class try // Should be escaped
        {
            int while = 1;
            int delete = 2; // Should not be escaped
        }

        class properties extends try // Should be escaped
        {
            int if = 2;
            xor catch;
            parfor spmd;
            switch otherwise;
        }

        exception persistent // Should be escaped
        {
            //
            // These symbols clash with members of MException and should be escaped.
            //
            string identifier = "1";
            string message = "2";
            string stack = "3";
            string cause = "4";
            string type = "5";

            logical end;
        }

        exception global extends persistent // Should be escaped
        {
            int enumeration = 1;
        }

        interface elseif // elseifPrx should not be escaped
        {
            void events();
            void function();
            void delete();
            void checkedCast();
        }

        const int methods = 1;
>>>>>>> Stashed changes
    }

>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct bitor // Should not be escaped
    {
        bitand case = catch;
        int continue = 1;
        int eq = 2;
        int ne = 3;
    }
<<<<<<< HEAD
        
=======

>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class logical // Should not be escaped
    {
        bitand else = enumeration;
        bitor for;
        bool int64 = true; // Should not be escaped
    }
<<<<<<< HEAD
        
=======

>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class xor extends logical // Should not be escaped
    {
        int return = 1;
    }
<<<<<<< HEAD
        
    sequence<bitor> parfor;
    dictionary<int, bitor> switch;
        
=======

    sequence<bitor> parfor;
    dictionary<int, bitor> switch;

>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class try // Should be escaped
    {
        int while = 1;
        int delete = 2; // Should not be escaped
    }
<<<<<<< HEAD
        
=======

>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class properties extends try // Should be escaped
    {
        int if = 2;
        xor catch;
        parfor spmd;
        switch otherwise;
    }
<<<<<<< HEAD
        
=======

>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception persistent // Should be escaped
    {
        //
        // These symbols clash with members of MException and should be escaped.
        //
        string identifier = "1";
        string message = "2";
        string stack = "3";
        string cause = "4";
        string type = "5";
<<<<<<< HEAD
            
        logical end;
    }
        
=======

        logical end;
    }

>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception global extends persistent // Should be escaped
    {
        int enumeration = 1;
    }
<<<<<<< HEAD
        
=======

>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface elseif // elseifPrx should not be escaped
    {
        void events();
        void function();
        void delete();
        void checkedCast();
    }
<<<<<<< HEAD
        
=======

>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    const int methods = 1;
}
