// Copyright (c) ZeroC, Inc.

import Foundation
import Ice
import TestCommon

class TestI: TestIntf {
    init() {}

    func transient(current: Ice.Current) async throws {
        let communicator = current.adapter.getCommunicator()

        let adapter = try communicator.createObjectAdapterWithEndpoints(
            name: "TransientTestAdapter",
            endpoints: "default")
        try adapter.activate()
        adapter.destroy()
    }

    func deactivate(current: Ice.Current) async throws {
        current.adapter.deactivate()
        try await Task.sleep(for: .milliseconds(100))
    }
}

class Cookie {
    func message() -> String {
        return "blahblah"
    }
}

class RouterI: Ice.Router {
    func getClientProxy(current _: Ice.Current) async throws -> (
        returnValue: ObjectPrx?, hasRoutingTable: Bool?
    ) {
        return (nil, false)
    }

    func addProxies(proxies _: [ObjectPrx?], current _: Current) async throws -> [ObjectPrx?] {
        return []
    }

    func getServerProxy(current: Ice.Current) async throws -> Ice.ObjectPrx? {
        return try makeProxy(
            communicator: current.adapter.getCommunicator(),
            proxyString: "dummy:tcp -h localhost -p 23456 -t 30000",
            type: Ice.ObjectPrx.self)
    }
}

class ServantLocatorI: Ice.ServantLocator {
    var _helper: TestHelper
    var _deactivated: Bool
    var _router = RouterI()
    var _lock = os_unfair_lock()

    init(helper: TestHelper) {
        _deactivated = false
        _helper = helper
    }

    deinit {
        precondition(_deactivated)
    }

    func locate(_ current: Ice.Current) throws -> (returnValue: Dispatcher?, cookie: AnyObject?) {
        try withLock(&_lock) {
            try _helper.test(!_deactivated)
        }

        if current.id.name == "router" {
            return (RouterDisp(_router), Cookie())
        }

        try _helper.test(current.id.category == "")
        try _helper.test(current.id.name == "test")

        return (TestIntfDisp(TestI()), Cookie())
    }

    func finished(curr current: Ice.Current, servant _: Ice.Dispatcher, cookie: AnyObject?) throws {
        try withLock(&_lock) {
            try _helper.test(!_deactivated)
        }

        if current.id.name == "router" {
            return
        }

        try _helper.test((cookie as! Cookie).message() == "blahblah")
    }

    func deactivate(_: String) {
        do {
            try withLock(&_lock) {
                try _helper.test(!_deactivated)
                _deactivated = true
            }
        } catch {
            fatalError("\(error)")
        }
    }
}
