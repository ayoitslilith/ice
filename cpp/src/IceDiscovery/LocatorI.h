// Copyright (c) ZeroC, Inc.

#ifndef LOCATORI_H
#define LOCATORI_H

#include "Ice/Locator.h"

#include <set>

namespace IceDiscovery
{
    class LocatorRegistryI final : public Ice::LocatorRegistry
    {
    public:
        LocatorRegistryI(const Ice::CommunicatorPtr&);

        void setAdapterDirectProxyAsync(
            std::string,
            std::optional<Ice::ObjectPrx>,
            std::function<void()>,
            std::function<void(std::exception_ptr)>,
            const Ice::Current&) final;

        void setReplicatedAdapterDirectProxyAsync(
            std::string,
            std::string,
            std::optional<Ice::ObjectPrx>,
            std::function<void()>,
            std::function<void(std::exception_ptr)>,
            const Ice::Current&) override;

        void setServerProcessProxyAsync(
            std::string,
            std::optional<Ice::ProcessPrx>,
            std::function<void()>,
            std::function<void(std::exception_ptr)>,
            const Ice::Current&) final;

        [[nodiscard]] std::optional<Ice::ObjectPrx> findObject(const Ice::Identity&) const;
        std::optional<Ice::ObjectPrx> findAdapter(const std::string&, bool&) const;

    private:
        const Ice::ObjectPrx _wellKnownProxy;
        std::map<std::string, Ice::ObjectPrx> _adapters;
        std::map<std::string, std::set<std::string>> _replicaGroups;
        mutable std::mutex _mutex;
    };
    using LocatorRegistryIPtr = std::shared_ptr<LocatorRegistryI>;

    class LookupI;
    using LookupIPtr = std::shared_ptr<LookupI>;

    class LocatorI final : public Ice::Locator
    {
    public:
        LocatorI(LookupIPtr, Ice::LocatorRegistryPrx);

        void findObjectByIdAsync(
            Ice::Identity,
            std::function<void(const std::optional<Ice::ObjectPrx>&)>,
            std::function<void(std::exception_ptr)>,
            const Ice::Current&) const final;

        void findAdapterByIdAsync(
            std::string,
            std::function<void(const std::optional<Ice::ObjectPrx>&)>,
            std::function<void(std::exception_ptr)>,
            const Ice::Current&) const override;

        [[nodiscard]] std::optional<Ice::LocatorRegistryPrx> getRegistry(const Ice::Current&) const final;

    private:
        LookupIPtr _lookup;
        Ice::LocatorRegistryPrx _registry;
    };

};

#endif
