#!/usr/bin/env python3

# Copyright (c) ZeroC, Inc.

from TestHelper import TestHelper

TestHelper.loadSlice("Test.ice")

try:
    TestHelper.loadSlice("TestNumPy.ice")
except ImportError:
    pass

import AllTests


class Client(TestHelper):
    def run(self, args):
        with self.initialize(args=args) as communicator:
            custom = AllTests.allTests(self, communicator)
            custom.shutdown()
