// Copyright (c) ZeroC, Inc.
    
#pragma once
    
["cs:namespace:Ice.dictMapping.AMD"]
module Test
{
    dictionary<int, int> NV;
    dictionary<string, string> NR;
    dictionary<string, NV> NDV;
    dictionary<string, NR> NDR;
<<<<<<< HEAD
        
    sequence<int> AIS;
    ["cs:generic:List"] sequence<int> GIS;
        
    sequence<string> ASS;
    ["cs:generic:List"] sequence<string> GSS;
        
    dictionary<string, AIS> NDAIS;
    dictionary<string, GIS> NDGIS;
        
    dictionary<string, ASS> NDASS;
    dictionary<string, GSS> NDGSS;
        
    ["amd"] interface MyClass
    {
        void shutdown();
            
=======
<<<<<<< Updated upstream

    sequence<int> AIS;
    ["cs:generic:List"] sequence<int> GIS;

    sequence<string> ASS;
    ["cs:generic:List"] sequence<string> GSS;

    dictionary<string, AIS> NDAIS;
    dictionary<string, GIS> NDGIS;

    dictionary<string, ASS> NDASS;
    dictionary<string, GSS> NDGSS;

    ["amd"] interface MyClass
    {
        void shutdown();

=======

    sequence<int> AIS;
    ["cs:generic:List"] sequence<int> GIS;

    sequence<string> ASS;
    ["cs:generic:List"] sequence<string> GSS;

    dictionary<string, AIS> NDAIS;
    dictionary<string, GIS> NDGIS;

    dictionary<string, ASS> NDASS;
    dictionary<string, GSS> NDGSS;

    ["amd"] interface MyClass
    {
        void shutdown();

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        NV opNV(NV i, out NV o);
        NR opNR(NR i, out NR o);
        NDV opNDV(NDV i, out NDV o);
        NDR opNDR(NDR i, out NDR o);
<<<<<<< HEAD
            
        NDAIS opNDAIS(NDAIS i, out NDAIS o);
        NDGIS opNDGIS(NDGIS i, out NDGIS o);
            
=======
<<<<<<< Updated upstream

        NDAIS opNDAIS(NDAIS i, out NDAIS o);
        NDGIS opNDGIS(NDGIS i, out NDGIS o);

=======

        NDAIS opNDAIS(NDAIS i, out NDAIS o);
        NDGIS opNDGIS(NDGIS i, out NDGIS o);

>>>>>>> Stashed changes
>>>>>>> 5ab9b67d67d9af9e590bc25ecd7604eaf455ede0
        NDASS opNDASS(NDASS i, out NDASS o);
        NDGSS opNDGSS(NDGSS i, out NDGSS o);
    }
}
