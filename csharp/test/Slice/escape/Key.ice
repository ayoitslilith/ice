// Copyright (c) ZeroC, Inc.
    
#pragma once
    
// TODO: figure out a better way to map module names.
module escaped_abstract
{
    ["cs:identifier:@as"]
    enum as
    {
        ["cs:identifier:@base"] base
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    ["cs:identifier:@break"]
    struct break
    {
        ["cs:identifier:@readonly"] int readonly;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    ["cs:identifier:@fixed"]
    exception fixed
    {
        ["cs:identifier:@for"] int for;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    ["cs:identifier:@foreach"]
    exception foreach extends fixed
    {
        ["cs:identifier:@goto"] int goto;
        ["cs:identifier:@if"] int Message;
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    ["cs:identifier:@case"]
    interface case
    {
        /// @param continue make sure the parameter doc-comment is mapped without a leading '@'.
        ["amd", "cs:identifier:@catch"] void catch(
<<<<<<< HEAD
            ["cs:identifier:@checked"] int checked,
            out ["cs:identifier:@continue"] int continue
        );
    }
        
=======
<<<<<<< Updated upstream
        ["cs:identifier:@checked"] int checked,
        out ["cs:identifier:@continue"] int continue
        );
    }

>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    ["cs:identifier:@decimal"]
    interface decimal
    {
        ["cs:identifier:@default"]
        /// @throws foreach make sure the link is correctly generated.
        void default() throws foreach;
    }
<<<<<<< HEAD
        
=======

>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    ["cs:identifier:@delegate"]
    class delegate
    {
        ["cs:identifier:@if"] int if;
        ["cs:identifier:@else"] case* else;
    }
<<<<<<< HEAD
        
=======

>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    ["cs:identifier:TotallyDifferent"]
    interface explicit extends decimal, case
    {
    }
<<<<<<< HEAD
        
    ["cs:identifier:@while"]
    dictionary<string, break> while;
        
=======

    ["cs:identifier:@while"]
    dictionary<string, break> while;

>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    class optionalMembers
    {
        ["cs:identifier:@for"] optional(1) break for;
        ["cs:identifier:@goto"] optional(2) as goto;
        ["cs:identifier:@if"] optional(3) explicit* if;
        ["cs:identifier:@internal"] optional(5) while internal;
        ["cs:identifier:@namespace"] optional(7) string namespace;
    }
<<<<<<< HEAD
        
=======

    interface optionalParams
    {
        ["cs:identifier:@for"]
        optional(1) break for(
        ["cs:identifier:@goto"] optional(2) as goto,
        ["cs:identifier:@if"] optional(3) explicit* if,
        ["cs:identifier:@internal"] optional(5) while internal,
        optional(7) string context
        );

        ["amd", "cs:identifier:@continue"]
        optional(1) break continue(
        ["cs:identifier:@goto"] optional(2) as goto,
        ["cs:identifier:@if"] optional(3) explicit* if,
        ["cs:identifier:@internal"] optional(5) while internal,
        optional(7) string context
        );

        ["cs:identifier:@in"]
        optional(1) break in(
        out ["cs:identifier:@goto"] optional(2) as goto,
        out ["cs:identifier:@if"] optional(3) explicit* if,
        out ["cs:identifier:@internal"] optional(5) while internal,
        out optional(7) string context
        );

        ["amd", "cs:identifier:@foreach"]
        optional(1) break foreach(
        out ["cs:identifier:@goto"] optional(2) as goto,
        out ["cs:identifier:@if"] optional(3) explicit* if,
        out ["cs:identifier:@internal"] optional(5) while internal,
        out optional(7) string context
        );
    }

    ["cs:identifier:@protected"]
    const int protected = 0;
    ["cs:identifier:@struct"]
    const int \struct = 1;

    // System as inner module.
    module System
    {
        interface Test
        {
            void op();
        }
    }
=======
            ["cs:identifier:@checked"] int checked,
            out ["cs:identifier:@continue"] int continue
        );
    }

    ["cs:identifier:@decimal"]
    interface decimal
    {
        ["cs:identifier:@default"]
        /// @throws foreach make sure the link is correctly generated.
        void default() throws foreach;
    }

    ["cs:identifier:@delegate"]
    class delegate
    {
        ["cs:identifier:@if"] int if;
        ["cs:identifier:@else"] case* else;
    }

    ["cs:identifier:TotallyDifferent"]
    interface explicit extends decimal, case
    {
    }

    ["cs:identifier:@while"]
    dictionary<string, break> while;

    class optionalMembers
    {
        ["cs:identifier:@for"] optional(1) break for;
        ["cs:identifier:@goto"] optional(2) as goto;
        ["cs:identifier:@if"] optional(3) explicit* if;
        ["cs:identifier:@internal"] optional(5) while internal;
        ["cs:identifier:@namespace"] optional(7) string namespace;
    }

>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface optionalParams
    {
        ["cs:identifier:@for"]
        optional(1) break for(
        ["cs:identifier:@goto"] optional(2) as goto,
        ["cs:identifier:@if"] optional(3) explicit* if,
        ["cs:identifier:@internal"] optional(5) while internal,
        optional(7) string context
    );
        
    ["amd", "cs:identifier:@continue"]
    optional(1) break continue(
        ["cs:identifier:@goto"] optional(2) as goto,
        ["cs:identifier:@if"] optional(3) explicit* if,
        ["cs:identifier:@internal"] optional(5) while internal,
        optional(7) string context
    );
    
    ["cs:identifier:@in"]
    optional(1) break in(
        out ["cs:identifier:@goto"] optional(2) as goto,
        out ["cs:identifier:@if"] optional(3) explicit* if,
        out ["cs:identifier:@internal"] optional(5) while internal,
        out optional(7) string context
    );

    ["amd", "cs:identifier:@foreach"]
    optional(1) break foreach(
        out ["cs:identifier:@goto"] optional(2) as goto,
        out ["cs:identifier:@if"] optional(3) explicit* if,
        out ["cs:identifier:@internal"] optional(5) while internal,
        out optional(7) string context
    );
}

["cs:identifier:@protected"]
const int protected = 0;
["cs:identifier:@struct"]
const int \struct = 1;

// System as inner module.
module System
{
    interface Test
    {
        void op();
    }
}
<<<<<<< HEAD
=======
>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
}

// System as outer module.
module System
{
    interface Test
    {
        void op();
    }
}
