// Copyright (c) ZeroC, Inc.

interface Foo
{
    void op() throws UndefinedException;
    void op2() throws class;
}

sequence<int> IntSeq;

struct S
{
    int i;
}

dictionary<string, string> StringDict;

enum E { red }

const int x = 1;
