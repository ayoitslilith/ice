//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

#ifndef ICE_REFERENCE_FACTORY_H
#define ICE_REFERENCE_FACTORY_H

#include "Ice/BuiltinSequences.h"
#include "Ice/ConnectionIF.h"
#include "Reference.h" // For Reference::Mode
#include "ReferenceFactoryF.h"

namespace IceInternal
{
    class ReferenceFactory : public std::enable_shared_from_this<ReferenceFactory>
    {
    public:
        ReferenceFactory(InstancePtr, Ice::CommunicatorPtr);

        // Create a direct reference.
        ReferencePtr
        create(Ice::Identity ident, std::string facet, const ReferencePtr& tmpl, std::vector<EndpointIPtr> endpoints);

        // Create an indirect reference.
        ReferencePtr create(Ice::Identity ident, std::string facet, const ReferencePtr& tmpl, std::string adapterId);

        // Create a fixed reference.
        ReferencePtr create(Ice::Identity ident, Ice::ConnectionIPtr connection);

        // Create a reference from a string.
        ReferencePtr create(std::string_view proxyString, const std::string& prefix);

        // Create a reference by unmarshaling it from a stream.
        ReferencePtr create(Ice::Identity ident, Ice::InputStream*);

        ReferenceFactoryPtr setDefaultRouter(std::optional<Ice::RouterPrx>);
        std::optional<Ice::RouterPrx> getDefaultRouter() const;

        ReferenceFactoryPtr setDefaultLocator(std::optional<Ice::LocatorPrx>);
        std::optional<Ice::LocatorPrx> getDefaultLocator() const;

    private:
        RoutableReferencePtr create(
            Ice::Identity,
            std::string,
            Reference::Mode,
            bool,
            Ice::ProtocolVersion,
            Ice::EncodingVersion,
            std::vector<EndpointIPtr>,
            std::string,
            std::string);

        const InstancePtr _instance;
        const Ice::CommunicatorPtr _communicator;
        std::optional<Ice::RouterPrx> _defaultRouter;
        std::optional<Ice::LocatorPrx> _defaultLocator;
    };
}

#endif
