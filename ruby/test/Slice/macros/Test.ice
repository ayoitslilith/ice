// Copyright (c) ZeroC, Inc.
    
//
// This macro sets the default value only when compiling with slice2rb.
//
#ifdef __SLICE2RB__
#   define DEFAULT(X) = X
#else
#   define DEFAULT(X) /**/
#endif
    
//
// This macro sets the default value only when not compiling with slice2rb.
//
#ifndef __SLICE2RB__
#   define NODEFAULT(X) = X
#else
#   define NODEFAULT(X) /**/
#endif
    
module Test
{
    class Default
    {
        int x DEFAULT(10);
        int y DEFAULT(10);
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class NoDefault
    {
        int x NODEFAULT(10);
        int y NODEFAULT(10);
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    //
    // This class is only defined when compiling with slice2rb.
    //
    #ifdef __SLICE2RB__
    class RubyOnly
    {
        string lang DEFAULT("ruby");
        int version DEFAULT(ICE_VERSION);
    }
    #endif
}
