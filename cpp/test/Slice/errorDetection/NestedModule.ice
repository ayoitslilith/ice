// Copyright (c) ZeroC, Inc.
    
// Case where the module chain is all good.
module All::Good::Here
{
    module Okay {}
    module Holder {}            // Error: 'Holder' suffix is reserved
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    module Okay::Holder {}      // Error: 'Holder' suffix is reserved
}
    
// Case where the module chain is broken.
module An::__Iceberg::Ahead      // Error: illegal leading underscore
{
    module Okay {}
    module Holder {}            // Error: 'Holder' suffix is reserved
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    module Okay::Holder {}      // Error: 'Holder' suffix is reserved
}
    
// Ensure that each module segment is individually checked for errors.
module APtr::Okay::BPrx::Fine::CHelper {}
<<<<<<< HEAD
    
=======
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
// Ensure that modules cannot start with a '::' character.
module ::No::Leading::Helper {}
