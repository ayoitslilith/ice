// Copyright (c) ZeroC, Inc.

#pragma once

#include "Ice/BuiltinSequences.ice"

["java:identifier:test.Ice.executor.Test"]
module Test
{
    interface TestIntf
    {
        void op();
        void sleep(int to);
        void opWithPayload(Ice::ByteSeq seq);
        void shutdown();
    }

    interface TestIntfController
    {
        void holdAdapter();
        void resumeAdapter();
    }
}
