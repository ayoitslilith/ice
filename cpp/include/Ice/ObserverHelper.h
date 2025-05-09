// Copyright (c) ZeroC, Inc.

#ifndef ICE_OBSERVER_HELPER_H
#define ICE_OBSERVER_HELPER_H

#include "InstanceF.h"
#include "Instrumentation.h"

#include <string_view>

namespace Ice
{
    class ObjectPrx;
}

namespace IceInternal
{
    std::string getExceptionId(std::exception_ptr);

    template<typename T = Ice::Instrumentation::Observer> class ObserverHelperT
    {
    public:
        using TPtr = std::shared_ptr<T>;

        ObserverHelperT() = default;

        ~ObserverHelperT()
        {
            if (_observer)
            {
                _observer->detach();
            }
        }

        operator bool() const { return _observer != nullptr; }

        T* operator->() const { return _observer.get(); }

        void attach(const TPtr& o)
        {
            //
            // Don't detach the existing observer. The observer is being
            // replaced and the observed object is still being observed!
            //
            // if(_observer)
            // {
            //     _observer->detach();
            // }
            _observer = o;
            if (_observer)
            {
                _observer->attach();
            }
        }
        [[nodiscard]] TPtr get() const { return _observer; }

        void adopt(ObserverHelperT& other)
        {
            _observer = other._observer;
            other._observer = 0;
        }

        void detach()
        {
            if (_observer)
            {
                _observer->detach();
                _observer = nullptr;
            }
        }

        void failed(const std::string& reason)
        {
            if (_observer)
            {
                _observer->failed(reason);
            }
        }

    protected:
        TPtr _observer;
    };

    class ICE_API DispatchObserver : public ObserverHelperT<Ice::Instrumentation::DispatchObserver>
    {
    public:
        void userException()
        {
            if (_observer)
            {
                _observer->userException();
            }
        }

        void reply(std::int32_t size)
        {
            if (_observer)
            {
                _observer->reply(size);
            }
        }
    };

    class ICE_API InvocationObserver : public ObserverHelperT<Ice::Instrumentation::InvocationObserver>
    {
    public:
        InvocationObserver(const Ice::ObjectPrx& proxy, std::string_view operation, const Ice::Context& context);
        InvocationObserver(Instance* instance, std::string_view operation);
        InvocationObserver() = default;

        void attach(const Ice::ObjectPrx&, std::string_view operation, const Ice::Context&);
        void attach(Instance*, std::string_view operation);

        void retried()
        {
            if (_observer)
            {
                _observer->retried();
            }
        }

        Ice::Instrumentation::ChildInvocationObserverPtr
        getRemoteObserver(const Ice::ConnectionInfoPtr& con, const Ice::EndpointPtr& endpt, int requestId, int size)
        {
            if (_observer)
            {
                return _observer->getRemoteObserver(con, endpt, requestId, size);
            }
            return nullptr;
        }

        Ice::Instrumentation::ChildInvocationObserverPtr
        getCollocatedObserver(const Ice::ObjectAdapterPtr& adapter, int requestId, int size)
        {
            if (_observer)
            {
                return _observer->getCollocatedObserver(adapter, requestId, size);
            }
            return nullptr;
        }

        void userException()
        {
            if (_observer)
            {
                _observer->userException();
            }
        }

    private:
        using ObserverHelperT<Ice::Instrumentation::InvocationObserver>::attach;
    };
}

#endif
