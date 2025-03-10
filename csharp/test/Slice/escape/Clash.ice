// Copyright (c) ZeroC, Inc.
    
module Clash
{
    interface Intf
    {
        void context();
        void current();
        void response();
        void typeId();
        void del();
        void cookie();
        void sync();
        void inS();
        void istr();
        void obj();
<<<<<<< HEAD
            
        void op(string context, string current, string response, string ex, string sent, string cookie,
            string sync, string result, string istr, string ostr, optional(1) string proxy, optional(2) int obj);
=======
<<<<<<< Updated upstream

        void op(string context, string current, string response, string ex, string sent, string cookie,
            string sync, string result, string istr, string ostr, optional(1) string proxy, optional(2) int obj);
        void opOut(out string context, out string current, out string response, out string ex,
               out string sent, out string cookie, out string sync, out string result, out string istr,
               out string ostr, out optional(1) string proxy, out optional(2) int obj);
    }

    class Cls
    {
        Intf* s;
        string context;
        int current;
        short response;
        int typeId;
        short del;
        optional(1) short cookie;
        string ex;
        int result;
        string istr;
        string ostr;
        string inS;
        ["cs:identifier:@in"] string in;
        string proxy;
        int obj;
        int getCookie;
        ["cs:identifier:ice_clone_"] string clone;
    }

    struct St
    {
        string v;
        short istr;
        int ostr;
        int rhs;
        string hashCode;
        ["cs:identifier:ice_clone_"] int clone;
    }

    exception Ex
    {
        short istr;
        int ostr;
        string cause;
    }
}
=======

        void op(string context, string current, string response, string ex, string sent, string cookie,
            string sync, string result, string istr, string ostr, optional(1) string proxy, optional(2) int obj);
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
            void opOut(out string context, out string current, out string response, out string ex,
                out string sent, out string cookie, out string sync, out string result, out string istr,
                out string ostr, out optional(1) string proxy, out optional(2) int obj);
            }
<<<<<<< HEAD
                
=======

>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
            class Cls
            {
                Intf* s;
                string context;
                int current;
                short response;
                int typeId;
                short del;
                optional(1) short cookie;
                string ex;
                int result;
                string istr;
                string ostr;
                string inS;
                ["cs:identifier:@in"] string in;
                string proxy;
                int obj;
                int getCookie;
                ["cs:identifier:ice_clone_"] string clone;
            }
<<<<<<< HEAD
                
=======

>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
            struct St
            {
                string v;
                short istr;
                int ostr;
                int rhs;
                string hashCode;
                ["cs:identifier:ice_clone_"] int clone;
            }
<<<<<<< HEAD
                
=======

>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
            exception Ex
            {
                short istr;
                int ostr;
                string cause;
            }
        }
<<<<<<< HEAD
=======
>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
