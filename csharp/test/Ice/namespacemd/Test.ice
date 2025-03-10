// Copyright (c) ZeroC, Inc.
    
#pragma once
    
#include "Namespace.ice"
#include "NoNamespace.ice"
    
["cs:namespace:Ice.namespacemd"]
module Test
{
    interface Initial
    {
        NoNamespace::C1 getNoNamespaceC2AsC1();
        NoNamespace::C2 getNoNamespaceC2AsC2();
        void throwNoNamespaceE2AsE1() throws NoNamespace::E1;
        void throwNoNamespaceE2AsE2() throws NoNamespace::E2;
        void throwNoNamespaceNotify() throws NoNamespace::notify;
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        WithNamespace::C1 getWithNamespaceC2AsC1();
        WithNamespace::C2 getWithNamespaceC2AsC2();
        void throwWithNamespaceE2AsE1() throws WithNamespace::E1;
        void throwWithNamespaceE2AsE2() throws WithNamespace::E2;
<<<<<<< HEAD
            
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        void shutdown();
    }
}
