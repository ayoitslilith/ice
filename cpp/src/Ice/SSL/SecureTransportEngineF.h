// Copyright (c) ZeroC, Inc.

#ifndef ICE_SSL_SECURE_TRANSPORT_ENGINE_F_H
#define ICE_SSL_SECURE_TRANSPORT_ENGINE_F_H

#ifdef __APPLE__

#    include <memory>

namespace Ice::SSL::SecureTransport
{
    class SSLEngine;
    using SSLEnginePtr = std::shared_ptr<SSLEngine>;
}

#endif

#endif
