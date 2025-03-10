// Copyright (c) ZeroC, Inc.

#include "EndpointInfo.h"
#include "Ice/Ice.h"
#include "Util.h"

using namespace std;
using namespace IcePy;

namespace IcePy
{
    struct EndpointInfoObject
    {
        PyObject_HEAD Ice::EndpointInfoPtr* endpointInfo;
    };
}

extern "C" EndpointInfoObject*
endpointInfoNew(PyTypeObject* /*type*/, PyObject* /*args*/, PyObject* /*kwds*/)
{
    PyErr_Format(PyExc_RuntimeError, "An endpoint info cannot be created directly");
    return nullptr;
}

extern "C" void
endpointInfoDealloc(EndpointInfoObject* self)
{
    delete self->endpointInfo;
    Py_TYPE(self)->tp_free(reinterpret_cast<PyObject*>(self));
}

//
// Ice::EndpointInfo::type
//
extern "C" PyObject*
endpointInfoType(EndpointInfoObject* self, PyObject* /*args*/)
{
    assert(self->endpointInfo);
    try
    {
        int16_t type = (*self->endpointInfo)->type();
        return PyLong_FromLong(type);
    }
    catch (...)
    {
        setPythonException(current_exception());
        return nullptr;
    }
}

//
// Ice::EndpointInfo::datagram
//
extern "C" PyObject*
endpointInfoDatagram(EndpointInfoObject* self, PyObject* /*args*/)
{
    assert(self->endpointInfo);
    PyObject* b;
    try
    {
        b = (*self->endpointInfo)->datagram() ? Py_True : Py_False;
    }
    catch (...)
    {
        setPythonException(current_exception());
        return nullptr;
    }

    Py_INCREF(b);
    return b;
}

//
// Ice::EndpointInfo::secure
//
extern "C" PyObject*
endpointInfoSecure(EndpointInfoObject* self, PyObject* /*args*/)
{
    assert(self->endpointInfo);
    PyObject* b;
    try
    {
        b = (*self->endpointInfo)->secure() ? Py_True : Py_False;
    }
    catch (...)
    {
        setPythonException(current_exception());
        return nullptr;
    }

    Py_INCREF(b);
    return b;
}

extern "C" PyObject*
endpointInfoGetUnderlying(EndpointInfoObject* self, PyObject* /*args*/)
{
    return createEndpointInfo((*self->endpointInfo)->underlying);
}

extern "C" PyObject*
endpointInfoGetTimeout(EndpointInfoObject* self, PyObject* /*args*/)
{
    return PyLong_FromLong((*self->endpointInfo)->timeout);
}

extern "C" PyObject*
endpointInfoGetCompress(EndpointInfoObject* self, PyObject* /*args*/)
{
    return (*self->endpointInfo)->compress ? Py_True : Py_False;
}

extern "C" PyObject*
ipEndpointInfoGetHost(EndpointInfoObject* self, PyObject* /*args*/)
{
    auto info = dynamic_pointer_cast<Ice::IPEndpointInfo>(*self->endpointInfo);
    assert(info);
    return createString(info->host);
}

extern "C" PyObject*
ipEndpointInfoGetSourceAddress(EndpointInfoObject* self, PyObject* /*args*/)
{
    auto info = dynamic_pointer_cast<Ice::IPEndpointInfo>(*self->endpointInfo);
    assert(info);
    return createString(info->sourceAddress);
}

extern "C" PyObject*
ipEndpointInfoGetPort(EndpointInfoObject* self, PyObject* /*args*/)
{
    auto info = dynamic_pointer_cast<Ice::IPEndpointInfo>(*self->endpointInfo);
    assert(info);
    return PyLong_FromLong(info->port);
}

extern "C" PyObject*
udpEndpointInfoGetMcastInterface(EndpointInfoObject* self, PyObject* /*args*/)
{
    auto info = dynamic_pointer_cast<Ice::UDPEndpointInfo>(*self->endpointInfo);
    assert(info);
    return createString(info->mcastInterface);
}

extern "C" PyObject*
udpEndpointInfoGetMcastTtl(EndpointInfoObject* self, PyObject* /*args*/)
{
    auto info = dynamic_pointer_cast<Ice::UDPEndpointInfo>(*self->endpointInfo);
    assert(info);
    return PyLong_FromLong(info->mcastTtl);
}

extern "C" PyObject*
wsEndpointInfoGetResource(EndpointInfoObject* self, PyObject* /*args*/)
{
    auto info = dynamic_pointer_cast<Ice::WSEndpointInfo>(*self->endpointInfo);
    assert(info);
    return createString(info->resource);
}

extern "C" PyObject*
opaqueEndpointInfoGetRawBytes(EndpointInfoObject* self, PyObject* /*args*/)
{
    auto info = dynamic_pointer_cast<Ice::OpaqueEndpointInfo>(*self->endpointInfo);
    assert(info);
    return PyBytes_FromStringAndSize(
        reinterpret_cast<const char*>(&info->rawBytes[0]),
        static_cast<int>(info->rawBytes.size()));
}

extern "C" PyObject*
opaqueEndpointInfoGetRawEncoding(EndpointInfoObject* self, PyObject* /*args*/)
{
    auto info = dynamic_pointer_cast<Ice::OpaqueEndpointInfo>(*self->endpointInfo);
    assert(info);
    return IcePy::createEncodingVersion(info->rawEncoding);
}

static PyMethodDef EndpointInfoMethods[] = {
    {"type", reinterpret_cast<PyCFunction>(endpointInfoType), METH_NOARGS, PyDoc_STR("type() -> int")},
    {"datagram", reinterpret_cast<PyCFunction>(endpointInfoDatagram), METH_NOARGS, PyDoc_STR("datagram() -> bool")},
    {"secure", reinterpret_cast<PyCFunction>(endpointInfoSecure), METH_NOARGS, PyDoc_STR("secure() -> bool")},
    {0, 0} /* sentinel */
};

static PyGetSetDef EndpointInfoGetters[] = {
    {"underlying",
     reinterpret_cast<getter>(endpointInfoGetUnderlying),
     0,
     PyDoc_STR("underling endpoint information"),
     0},
    {"timeout", reinterpret_cast<getter>(endpointInfoGetTimeout), 0, PyDoc_STR("timeout in milliseconds"), 0},
    {"compress", reinterpret_cast<getter>(endpointInfoGetCompress), 0, PyDoc_STR("compression status"), 0},
    {0, 0} /* sentinel */
};

static PyGetSetDef IPEndpointInfoGetters[] = {
    {"host", reinterpret_cast<getter>(ipEndpointInfoGetHost), 0, PyDoc_STR("host name or IP address"), 0},
    {"port", reinterpret_cast<getter>(ipEndpointInfoGetPort), 0, PyDoc_STR("TCP port number"), 0},
    {"sourceAddress", reinterpret_cast<getter>(ipEndpointInfoGetSourceAddress), 0, PyDoc_STR("source IP address"), 0},
    {0, 0} /* sentinel */
};

static PyGetSetDef UDPEndpointInfoGetters[] = {
    {"mcastInterface",
     reinterpret_cast<getter>(udpEndpointInfoGetMcastInterface),
     0,
     PyDoc_STR("multicast interface"),
     0},
    {"mcastTtl", reinterpret_cast<getter>(udpEndpointInfoGetMcastTtl), 0, PyDoc_STR("multicast time-to-live"), 0},
    {0, 0} /* sentinel */
};

static PyGetSetDef WSEndpointInfoGetters[] = {
    {"resource", reinterpret_cast<getter>(wsEndpointInfoGetResource), 0, PyDoc_STR("resource"), 0},
    {0, 0} /* sentinel */
};

static PyGetSetDef OpaqueEndpointInfoGetters[] = {
    {"rawBytes", reinterpret_cast<getter>(opaqueEndpointInfoGetRawBytes), 0, PyDoc_STR("raw encoding"), 0},
    {"rawEncoding",
     reinterpret_cast<getter>(opaqueEndpointInfoGetRawEncoding),
     0,
     PyDoc_STR("raw encoding version"),
     0},
    {0, 0} /* sentinel */
};

namespace IcePy
{
    PyTypeObject EndpointInfoType = {
        /* The ob_type field must be initialized in the module init function
         * to be portable to Windows without using C++. */
        PyVarObject_HEAD_INIT(0, 0) "IcePy.EndpointInfo", /* tp_name */
        sizeof(EndpointInfoObject),                       /* tp_basicsize */
        0,                                                /* tp_itemsize */
        /* methods */
        reinterpret_cast<destructor>(endpointInfoDealloc), /* tp_dealloc */
        0,                                                 /* tp_print */
        0,                                                 /* tp_getattr */
        0,                                                 /* tp_setattr */
        0,                                                 /* tp_reserved */
        0,                                                 /* tp_repr */
        0,                                                 /* tp_as_number */
        0,                                                 /* tp_as_sequence */
        0,                                                 /* tp_as_mapping */
        0,                                                 /* tp_hash */
        0,                                                 /* tp_call */
        0,                                                 /* tp_str */
        0,                                                 /* tp_getattro */
        0,                                                 /* tp_setattro */
        0,                                                 /* tp_as_buffer */
        Py_TPFLAGS_DEFAULT | Py_TPFLAGS_BASETYPE,          /* tp_flags */
        0,                                                 /* tp_doc */
        0,                                                 /* tp_traverse */
        0,                                                 /* tp_clear */
        0,                                                 /* tp_richcompare */
        0,                                                 /* tp_weaklistoffset */
        0,                                                 /* tp_iter */
        0,                                                 /* tp_iternext */
        EndpointInfoMethods,                               /* tp_methods */
        0,                                                 /* tp_members */
        EndpointInfoGetters,                               /* tp_getset */
        0,                                                 /* tp_base */
        0,                                                 /* tp_dict */
        0,                                                 /* tp_descr_get */
        0,                                                 /* tp_descr_set */
        0,                                                 /* tp_dictoffset */
        0,                                                 /* tp_init */
        0,                                                 /* tp_alloc */
        reinterpret_cast<newfunc>(endpointInfoNew),        /* tp_new */
        0,                                                 /* tp_free */
        0,                                                 /* tp_is_gc */
    };

    PyTypeObject IPEndpointInfoType = {
        /* The ob_type field must be initialized in the module init function
         * to be portable to Windows without using C++. */
        PyVarObject_HEAD_INIT(0, 0) "IcePy.IPEndpointInfo", /* tp_name */
        sizeof(EndpointInfoObject),                         /* tp_basicsize */
        0,                                                  /* tp_itemsize */
        /* methods */
        reinterpret_cast<destructor>(endpointInfoDealloc), /* tp_dealloc */
        0,                                                 /* tp_print */
        0,                                                 /* tp_getattr */
        0,                                                 /* tp_setattr */
        0,                                                 /* tp_reserved */
        0,                                                 /* tp_repr */
        0,                                                 /* tp_as_number */
        0,                                                 /* tp_as_sequence */
        0,                                                 /* tp_as_mapping */
        0,                                                 /* tp_hash */
        0,                                                 /* tp_call */
        0,                                                 /* tp_str */
        0,                                                 /* tp_getattro */
        0,                                                 /* tp_setattro */
        0,                                                 /* tp_as_buffer */
        Py_TPFLAGS_DEFAULT | Py_TPFLAGS_BASETYPE,          /* tp_flags */
        0,                                                 /* tp_doc */
        0,                                                 /* tp_traverse */
        0,                                                 /* tp_clear */
        0,                                                 /* tp_richcompare */
        0,                                                 /* tp_weaklistoffset */
        0,                                                 /* tp_iter */
        0,                                                 /* tp_iternext */
        0,                                                 /* tp_methods */
        0,                                                 /* tp_members */
        IPEndpointInfoGetters,                             /* tp_getset */
        0,                                                 /* tp_base */
        0,                                                 /* tp_dict */
        0,                                                 /* tp_descr_get */
        0,                                                 /* tp_descr_set */
        0,                                                 /* tp_dictoffset */
        0,                                                 /* tp_init */
        0,                                                 /* tp_alloc */
        reinterpret_cast<newfunc>(endpointInfoNew),        /* tp_new */
        0,                                                 /* tp_free */
        0,                                                 /* tp_is_gc */
    };

    PyTypeObject TCPEndpointInfoType = {
        /* The ob_type field must be initialized in the module init function
         * to be portable to Windows without using C++. */
        PyVarObject_HEAD_INIT(0, 0) "IcePy.TCPEndpointInfo", /* tp_name */
        sizeof(EndpointInfoObject),                          /* tp_basicsize */
        0,                                                   /* tp_itemsize */
        /* methods */
        reinterpret_cast<destructor>(endpointInfoDealloc), /* tp_dealloc */
        0,                                                 /* tp_print */
        0,                                                 /* tp_getattr */
        0,                                                 /* tp_setattr */
        0,                                                 /* tp_reserved */
        0,                                                 /* tp_repr */
        0,                                                 /* tp_as_number */
        0,                                                 /* tp_as_sequence */
        0,                                                 /* tp_as_mapping */
        0,                                                 /* tp_hash */
        0,                                                 /* tp_call */
        0,                                                 /* tp_str */
        0,                                                 /* tp_getattro */
        0,                                                 /* tp_setattro */
        0,                                                 /* tp_as_buffer */
        Py_TPFLAGS_DEFAULT | Py_TPFLAGS_BASETYPE,          /* tp_flags */
        0,                                                 /* tp_doc */
        0,                                                 /* tp_traverse */
        0,                                                 /* tp_clear */
        0,                                                 /* tp_richcompare */
        0,                                                 /* tp_weaklistoffset */
        0,                                                 /* tp_iter */
        0,                                                 /* tp_iternext */
        0,                                                 /* tp_methods */
        0,                                                 /* tp_members */
        0,                                                 /* tp_getset */
        0,                                                 /* tp_base */
        0,                                                 /* tp_dict */
        0,                                                 /* tp_descr_get */
        0,                                                 /* tp_descr_set */
        0,                                                 /* tp_dictoffset */
        0,                                                 /* tp_init */
        0,                                                 /* tp_alloc */
        reinterpret_cast<newfunc>(endpointInfoNew),        /* tp_new */
        0,                                                 /* tp_free */
        0,                                                 /* tp_is_gc */
    };

    PyTypeObject UDPEndpointInfoType = {
        /* The ob_type field must be initialized in the module init function
         * to be portable to Windows without using C++. */
        PyVarObject_HEAD_INIT(0, 0) "IcePy.UDPEndpointInfo", /* tp_name */
        sizeof(EndpointInfoObject),                          /* tp_basicsize */
        0,                                                   /* tp_itemsize */
        /* methods */
        reinterpret_cast<destructor>(endpointInfoDealloc), /* tp_dealloc */
        0,                                                 /* tp_print */
        0,                                                 /* tp_getattr */
        0,                                                 /* tp_setattr */
        0,                                                 /* tp_reserved */
        0,                                                 /* tp_repr */
        0,                                                 /* tp_as_number */
        0,                                                 /* tp_as_sequence */
        0,                                                 /* tp_as_mapping */
        0,                                                 /* tp_hash */
        0,                                                 /* tp_call */
        0,                                                 /* tp_str */
        0,                                                 /* tp_getattro */
        0,                                                 /* tp_setattro */
        0,                                                 /* tp_as_buffer */
        Py_TPFLAGS_DEFAULT | Py_TPFLAGS_BASETYPE,          /* tp_flags */
        0,                                                 /* tp_doc */
        0,                                                 /* tp_traverse */
        0,                                                 /* tp_clear */
        0,                                                 /* tp_richcompare */
        0,                                                 /* tp_weaklistoffset */
        0,                                                 /* tp_iter */
        0,                                                 /* tp_iternext */
        0,                                                 /* tp_methods */
        0,                                                 /* tp_members */
        UDPEndpointInfoGetters,                            /* tp_getset */
        0,                                                 /* tp_base */
        0,                                                 /* tp_dict */
        0,                                                 /* tp_descr_get */
        0,                                                 /* tp_descr_set */
        0,                                                 /* tp_dictoffset */
        0,                                                 /* tp_init */
        0,                                                 /* tp_alloc */
        reinterpret_cast<newfunc>(endpointInfoNew),        /* tp_new */
        0,                                                 /* tp_free */
        0,                                                 /* tp_is_gc */
    };

    PyTypeObject WSEndpointInfoType = {
        /* The ob_type field must be initialized in the module init function
         * to be portable to Windows without using C++. */
        PyVarObject_HEAD_INIT(0, 0) "IcePy.WSEndpointInfo", /* tp_name */
        sizeof(EndpointInfoObject),                         /* tp_basicsize */
        0,                                                  /* tp_itemsize */
        /* methods */
        reinterpret_cast<destructor>(endpointInfoDealloc), /* tp_dealloc */
        0,                                                 /* tp_print */
        0,                                                 /* tp_getattr */
        0,                                                 /* tp_setattr */
        0,                                                 /* tp_reserved */
        0,                                                 /* tp_repr */
        0,                                                 /* tp_as_number */
        0,                                                 /* tp_as_sequence */
        0,                                                 /* tp_as_mapping */
        0,                                                 /* tp_hash */
        0,                                                 /* tp_call */
        0,                                                 /* tp_str */
        0,                                                 /* tp_getattro */
        0,                                                 /* tp_setattro */
        0,                                                 /* tp_as_buffer */
        Py_TPFLAGS_DEFAULT | Py_TPFLAGS_BASETYPE,          /* tp_flags */
        0,                                                 /* tp_doc */
        0,                                                 /* tp_traverse */
        0,                                                 /* tp_clear */
        0,                                                 /* tp_richcompare */
        0,                                                 /* tp_weaklistoffset */
        0,                                                 /* tp_iter */
        0,                                                 /* tp_iternext */
        0,                                                 /* tp_methods */
        0,                                                 /* tp_members */
        WSEndpointInfoGetters,                             /* tp_getset */
        0,                                                 /* tp_base */
        0,                                                 /* tp_dict */
        0,                                                 /* tp_descr_get */
        0,                                                 /* tp_descr_set */
        0,                                                 /* tp_dictoffset */
        0,                                                 /* tp_init */
        0,                                                 /* tp_alloc */
        reinterpret_cast<newfunc>(endpointInfoNew),        /* tp_new */
        0,                                                 /* tp_free */
        0,                                                 /* tp_is_gc */
    };

    PyTypeObject SSLEndpointInfoType = {
        /* The ob_type field must be initialized in the module init function
         * to be portable to Windows without using C++. */
        PyVarObject_HEAD_INIT(0, 0) "IcePy.SSLEndpointInfo", /* tp_name */
        sizeof(EndpointInfoObject),                          /* tp_basicsize */
        0,                                                   /* tp_itemsize */
        /* methods */
        reinterpret_cast<destructor>(endpointInfoDealloc), /* tp_dealloc */
        0,                                                 /* tp_print */
        0,                                                 /* tp_getattr */
        0,                                                 /* tp_setattr */
        0,                                                 /* tp_reserved */
        0,                                                 /* tp_repr */
        0,                                                 /* tp_as_number */
        0,                                                 /* tp_as_sequence */
        0,                                                 /* tp_as_mapping */
        0,                                                 /* tp_hash */
        0,                                                 /* tp_call */
        0,                                                 /* tp_str */
        0,                                                 /* tp_getattro */
        0,                                                 /* tp_setattro */
        0,                                                 /* tp_as_buffer */
        Py_TPFLAGS_DEFAULT | Py_TPFLAGS_BASETYPE,          /* tp_flags */
        0,                                                 /* tp_doc */
        0,                                                 /* tp_traverse */
        0,                                                 /* tp_clear */
        0,                                                 /* tp_richcompare */
        0,                                                 /* tp_weaklistoffset */
        0,                                                 /* tp_iter */
        0,                                                 /* tp_iternext */
        0,                                                 /* tp_methods */
        0,                                                 /* tp_members */
        0,                                                 /* tp_getset */
        0,                                                 /* tp_base */
        0,                                                 /* tp_dict */
        0,                                                 /* tp_descr_get */
        0,                                                 /* tp_descr_set */
        0,                                                 /* tp_dictoffset */
        0,                                                 /* tp_init */
        0,                                                 /* tp_alloc */
        reinterpret_cast<newfunc>(endpointInfoNew),        /* tp_new */
        0,                                                 /* tp_free */
        0,                                                 /* tp_is_gc */
    };

    PyTypeObject OpaqueEndpointInfoType = {
        /* The ob_type field must be initialized in the module init function
         * to be portable to Windows without using C++. */
        PyVarObject_HEAD_INIT(0, 0) "IcePy.OpaqueEndpointInfo", /* tp_name */
        sizeof(EndpointInfoObject),                             /* tp_basicsize */
        0,                                                      /* tp_itemsize */
        /* methods */
        reinterpret_cast<destructor>(endpointInfoDealloc), /* tp_dealloc */
        0,                                                 /* tp_print */
        0,                                                 /* tp_getattr */
        0,                                                 /* tp_setattr */
        0,                                                 /* tp_reserved */
        0,                                                 /* tp_repr */
        0,                                                 /* tp_as_number */
        0,                                                 /* tp_as_sequence */
        0,                                                 /* tp_as_mapping */
        0,                                                 /* tp_hash */
        0,                                                 /* tp_call */
        0,                                                 /* tp_str */
        0,                                                 /* tp_getattro */
        0,                                                 /* tp_setattro */
        0,                                                 /* tp_as_buffer */
        Py_TPFLAGS_DEFAULT | Py_TPFLAGS_BASETYPE,          /* tp_flags */
        0,                                                 /* tp_doc */
        0,                                                 /* tp_traverse */
        0,                                                 /* tp_clear */
        0,                                                 /* tp_richcompare */
        0,                                                 /* tp_weaklistoffset */
        0,                                                 /* tp_iter */
        0,                                                 /* tp_iternext */
        0,                                                 /* tp_methods */
        0,                                                 /* tp_members */
        OpaqueEndpointInfoGetters,                         /* tp_getset */
        0,                                                 /* tp_base */
        0,                                                 /* tp_dict */
        0,                                                 /* tp_descr_get */
        0,                                                 /* tp_descr_set */
        0,                                                 /* tp_dictoffset */
        0,                                                 /* tp_init */
        0,                                                 /* tp_alloc */
        reinterpret_cast<newfunc>(endpointInfoNew),        /* tp_new */
        0,                                                 /* tp_free */
        0,                                                 /* tp_is_gc */
    };
}

bool
IcePy::initEndpointInfo(PyObject* module)
{
    if (PyType_Ready(&EndpointInfoType) < 0)
    {
        return false;
    }
    PyTypeObject* type = &EndpointInfoType; // Necessary to prevent GCC's strict-alias warnings.
    if (PyModule_AddObject(module, "EndpointInfo", reinterpret_cast<PyObject*>(type)) < 0)
    {
        return false;
    }

    IPEndpointInfoType.tp_base = &EndpointInfoType; // Force inheritance from EndpointInfoType.
    if (PyType_Ready(&IPEndpointInfoType) < 0)
    {
        return false;
    }
    type = &IPEndpointInfoType; // Necessary to prevent GCC's strict-alias warnings.
    if (PyModule_AddObject(module, "IPEndpointInfo", reinterpret_cast<PyObject*>(type)) < 0)
    {
        return false;
    }

    TCPEndpointInfoType.tp_base = &IPEndpointInfoType; // Force inheritance from IPEndpointInfoType.
    if (PyType_Ready(&TCPEndpointInfoType) < 0)
    {
        return false;
    }
    type = &TCPEndpointInfoType; // Necessary to prevent GCC's strict-alias warnings.
    if (PyModule_AddObject(module, "TCPEndpointInfo", reinterpret_cast<PyObject*>(type)) < 0)
    {
        return false;
    }

    UDPEndpointInfoType.tp_base = &IPEndpointInfoType; // Force inheritance from IPEndpointType.
    if (PyType_Ready(&UDPEndpointInfoType) < 0)
    {
        return false;
    }
    type = &UDPEndpointInfoType; // Necessary to prevent GCC's strict-alias warnings.
    if (PyModule_AddObject(module, "UDPEndpointInfo", reinterpret_cast<PyObject*>(type)) < 0)
    {
        return false;
    }

    WSEndpointInfoType.tp_base = &EndpointInfoType; // Force inheritance from IPEndpointType.
    if (PyType_Ready(&WSEndpointInfoType) < 0)
    {
        return false;
    }
    type = &WSEndpointInfoType; // Necessary to prevent GCC's strict-alias warnings.
    if (PyModule_AddObject(module, "WSEndpointInfo", reinterpret_cast<PyObject*>(type)) < 0)
    {
        return false;
    }

    SSLEndpointInfoType.tp_base = &EndpointInfoType; // Force inheritance from IPEndpointInfoType.
    if (PyType_Ready(&SSLEndpointInfoType) < 0)
    {
        return false;
    }
    type = &SSLEndpointInfoType; // Necessary to prevent GCC's strict-alias warnings.
    if (PyModule_AddObject(module, "SSLEndpointInfo", reinterpret_cast<PyObject*>(type)) < 0)
    {
        return false;
    }

    OpaqueEndpointInfoType.tp_base = &EndpointInfoType; // Force inheritance from EndpointType.
    if (PyType_Ready(&OpaqueEndpointInfoType) < 0)
    {
        return false;
    }
    type = &OpaqueEndpointInfoType; // Necessary to prevent GCC's strict-alias warnings.
    if (PyModule_AddObject(module, "OpaqueEndpointInfo", reinterpret_cast<PyObject*>(type)) < 0)
    {
        return false;
    }

    return true;
}

Ice::EndpointInfoPtr
IcePy::getEndpointInfo(PyObject* obj)
{
    assert(PyObject_IsInstance(obj, reinterpret_cast<PyObject*>(&EndpointInfoType)));
    EndpointInfoObject* eobj = reinterpret_cast<EndpointInfoObject*>(obj);
    return *eobj->endpointInfo;
}

PyObject*
IcePy::createEndpointInfo(const Ice::EndpointInfoPtr& endpointInfo)
{
    if (!endpointInfo)
    {
        return Py_None;
    }

    PyTypeObject* type;
    if (dynamic_pointer_cast<Ice::WSEndpointInfo>(endpointInfo))
    {
        type = &WSEndpointInfoType;
    }
    else if (dynamic_pointer_cast<Ice::TCPEndpointInfo>(endpointInfo))
    {
        type = &TCPEndpointInfoType;
    }
    else if (dynamic_pointer_cast<Ice::UDPEndpointInfo>(endpointInfo))
    {
        type = &UDPEndpointInfoType;
    }
    else if (dynamic_pointer_cast<Ice::SSL::EndpointInfo>(endpointInfo))
    {
        type = &SSLEndpointInfoType;
    }
    else if (dynamic_pointer_cast<Ice::OpaqueEndpointInfo>(endpointInfo))
    {
        type = &OpaqueEndpointInfoType;
    }
    else if (dynamic_pointer_cast<Ice::IPEndpointInfo>(endpointInfo))
    {
        type = &IPEndpointInfoType;
    }
    else
    {
        type = &EndpointInfoType;
    }

    EndpointInfoObject* obj = reinterpret_cast<EndpointInfoObject*>(type->tp_alloc(type, 0));
    if (!obj)
    {
        return nullptr;
    }
    obj->endpointInfo = new Ice::EndpointInfoPtr(endpointInfo);

    return (PyObject*)obj;
}
