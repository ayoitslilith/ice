// Copyright (c) ZeroC, Inc.
    
#pragma once
    
module Test
{
    class Empty
    {
    }
<<<<<<< HEAD
        
    class AlsoEmpty
    {
    }
        
=======
<<<<<<< Updated upstream

    class AlsoEmpty
    {
    }

=======

    class AlsoEmpty
    {
    }

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface UnexpectedObjectExceptionTest
    {
        Empty op();
    }
<<<<<<< HEAD
        
    //
    // Remaining definitions are here to ensure that the generated code compiles.
    //
        
=======
<<<<<<< Updated upstream

    //
    // Remaining definitions are here to ensure that the generated code compiles.
    //

=======

    //
    // Remaining definitions are here to ensure that the generated code compiles.
    //

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class COneMember
    {
        Empty e;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class CTwoMembers
    {
        Empty e1;
        Empty e2;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception EOneMember
    {
        Empty e;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    exception ETwoMembers
    {
        Empty e1;
        Empty e2;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct SOneMember
    {
        Empty e;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    struct STwoMembers
    {
        Empty e1;
        Empty e2;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    dictionary<int, COneMember> DOneMember;
    dictionary<int, CTwoMembers> DTwoMembers;
}
