#
# Copyright (c) ZeroC, Inc. All rights reserved.
#

from DataStormUtil import Reader, Writer
from Util import ClientServerTestCase, TestSuite
import sys

traceProps = {
    "DataStorm.Trace.Topic" : 1,
    "DataStorm.Trace.Session" : 3,
    "DataStorm.Trace.Data" : 2,
}

multicastProps = { "DataStorm.Node.Multicast.Enabled" : 1 }

test_cases = [
    ClientServerTestCase(
        name = "Writer/Reader",
        client = Writer(),
        server = Reader(),
        traceProps=traceProps),
]

# TODO - enable once we figure out https://github.com/zeroc-ice/ice/issues/2929
if sys.platform != "darwin":
    test_cases.append(
        ClientServerTestCase(
            name = "Writer/Reader multicast enabled",
            client = Writer(props = multicastProps),
            server = Reader(props = multicastProps),
            traceProps=traceProps),
    )

TestSuite(__file__, test_cases)
