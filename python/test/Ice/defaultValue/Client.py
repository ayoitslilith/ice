#!/usr/bin/env python3

# Copyright (c) ZeroC, Inc.

from TestHelper import TestHelper

TestHelper.loadSlice("Test.ice")
import AllTests


class Client(TestHelper):
    def run(self, args):
        AllTests.allTests()
