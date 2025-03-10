// Copyright (c) ZeroC, Inc.
    
#pragma once
    
#include "Test.ice"
    
module Test
{
    exception UnknownDerived extends Base
    {
        string ud;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception UnknownIntermediate extends Base
    {
        string ui;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception UnknownMostDerived1 extends KnownIntermediate
    {
        string umd1;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception UnknownMostDerived2 extends UnknownIntermediate
    {
        string umd2;
    }
}
