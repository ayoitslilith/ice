// Copyright (c) ZeroC, Inc.
    
#pragma once
    
module Test
{
    interface Server
    {
        void noCert();
        void checkCert(string subjectDN, string issuerDN);
        void checkCipher(string cipher);
    }
<<<<<<< HEAD
        
    dictionary<string, string> Properties;
        
=======
<<<<<<< Updated upstream

    dictionary<string, string> Properties;

=======

    dictionary<string, string> Properties;

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface ServerFactory
    {
        Server* createServer(Properties props);
        void destroyServer(Server* srv);
        void shutdown();
    }
<<<<<<< HEAD
        
=======
<<<<<<< Updated upstream

=======

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
    interface Pingable
    {
        void ping();
    }
}
