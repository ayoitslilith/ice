// Copyright (c) ZeroC, Inc.
    
#pragma once
    
module Test
{
    interface TestIntf
    {
        string getAdapterId();
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface Controller
    {
        void activateObjectAdapter(string name, string adapterId, string replicaGroupId);
        void deactivateObjectAdapter(string name);
<<<<<<< HEAD
            
        void addObject(string oaName, string id);
        void removeObject(string oaName, string id);
            
=======
<<<<<<< Updated upstream

        void addObject(string oaName, string id);
        void removeObject(string oaName, string id);

=======

        void addObject(string oaName, string id);
        void removeObject(string oaName, string id);

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        void shutdown();
    }
}
