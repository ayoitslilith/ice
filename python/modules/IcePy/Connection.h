// Copyright (c) ZeroC, Inc.

#ifndef ICEPY_CONNECTION_H
#define ICEPY_CONNECTION_H

#include "Config.h"
#include "Ice/Ice.h"

#include <string>

namespace IcePy
{
    bool initConnection(PyObject*);

    PyObject* createConnection(const Ice::ConnectionPtr&, const Ice::CommunicatorPtr&);

    bool checkConnection(PyObject*);
    bool getConnectionArg(PyObject*, const std::string&, const std::string&, Ice::ConnectionPtr&);
}

#endif
