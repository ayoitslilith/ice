# Copyright (c) ZeroC, Inc.

def allTests(helper, communicator)

    print "test using same type name in different Slice modules... "
    STDOUT.flush

    i1 = Test::MyInterfacePrx.new(communicator, "i1:#{helper.getTestEndpoint()}")

    s1 = Test::MyStruct.new(0)
    s2, s3 = i1.opMyStruct(s1)
    test(s2 == s1)
    test(s3 == s1)

    sseq1 = [s1]
    sseq2, sseq3 = i1.opMyStructSeq(sseq1)
    test(sseq2[0] == s1)
    test(sseq3[0] == s1)

    smap1 = {}
    smap1["a"] = s1
    smap2, smap3 = i1.opMyStructMap(smap1)
    test(smap2["a"] == s1)
    test(smap3["a"] == s1)

    c1 = Test::MyClass.new(s1)
    c2, c3 = i1.opMyClass(c1)
    test(c2.s == s1)
    test(c3.s == s1)

    cseq1 = [c1]
    cseq2, cseq3 = i1.opMyClassSeq(cseq1)
    test(cseq2[0].s == s1)
    test(cseq3[0].s == s1)

    cmap1 = {}
    cmap1["a"] = c1
    cmap2, cmap3 = i1.opMyClassMap(cmap1)
    test(cmap2["a"].s == s1)
    test(cmap3["a"].s == s1)

    e = i1.opMyEnum(Test::MyEnum::V1)
    test(e == Test::MyEnum::V1)

    s = i1.opMyOtherStruct(Test::MyOtherStruct.new("MyOtherStruct"))
    test(s.s == "MyOtherStruct")

    c = i1.opMyOtherClass(Test::MyOtherClass.new("MyOtherClass"))
    test(c.s == "MyOtherClass")

    i2 = Test::Inner::Inner2::MyInterfacePrx.new(communicator, "i2:#{helper.getTestEndpoint()}")

    s1 = Test::Inner::Inner2::MyStruct.new(0)
    s2, s3 = i2.opMyStruct(s1)
    test(s2 == s1)
    test(s3 == s1)

    sseq1 = [s1]
    sseq2, sseq3 = i2.opMyStructSeq(sseq1)
    test(sseq2[0] == s1)
    test(sseq3[0] == s1)

    smap1 = {}
    smap1["a"] = s1
    smap2, smap3 = i2.opMyStructMap(smap1)
    test(smap2["a"] == s1)
    test(smap3["a"] == s1)

    c1 = Test::Inner::Inner2::MyClass.new(s1)
    c2, c3 = i2.opMyClass(c1)
    test(c2.s == s1)
    test(c3.s == s1)

    cseq1 = [c1]
    cseq2, cseq3 = i2.opMyClassSeq(cseq1)
    test(cseq2[0].s == s1)
    test(cseq3[0].s == s1)

    cmap1 = {}
    cmap1["a"] = c1
    cmap2, cmap3 = i2.opMyClassMap(cmap1)
    test(cmap2["a"].s == s1)
    test(cmap3["a"].s == s1)

    i3 = Test::Inner::MyInterfacePrx.new(communicator, "i3:#{helper.getTestEndpoint()}")

    s1 = Test::Inner::Inner2::MyStruct.new(0)
    s2, s3 = i3.opMyStruct(s1)
    test(s2 == s1)
    test(s3 == s1)

    sseq1 = [s1]
    sseq2, sseq3 = i3.opMyStructSeq(sseq1)
    test(sseq2[0] == s1)
    test(sseq3[0] == s1)

    smap1 = {}
    smap1["a"] = s1
    smap2, smap3 = i3.opMyStructMap(smap1)
    test(smap2["a"] == s1)
    test(smap3["a"] == s1)

    c1 = Test::Inner::Inner2::MyClass.new(s1)
    c2, c3 = i3.opMyClass(c1)
    test(c2.s == s1)
    test(c3.s == s1)

    cseq1 = [c1]
    cseq2, cseq3 = i3.opMyClassSeq(cseq1)
    test(cseq2[0].s == s1)
    test(cseq3[0].s == s1)

    cmap1 = {}
    cmap1["a"] = c1
    cmap2, cmap3 = i3.opMyClassMap(cmap1)
    test(cmap2["a"].s == s1)
    test(cmap3["a"].s == s1)

    i4 = Inner::Test::Inner2::MyInterfacePrx.new(communicator, "i4:#{helper.getTestEndpoint()}")

    s1 = Test::MyStruct.new(0)
    s2, s3 = i4.opMyStruct(s1)
    test(s2 == s1)
    test(s3 == s1)

    sseq1 = [s1]
    sseq2, sseq3 = i4.opMyStructSeq(sseq1)
    test(sseq2[0] == s1)
    test(sseq3[0] == s1)

    smap1 = {}
    smap1["a"] = s1
    smap2, smap3 = i4.opMyStructMap(smap1)
    test(smap2["a"] == s1)
    test(smap3["a"] == s1)

    c1 = Test::MyClass.new(s1)
    c2, c3 = i4.opMyClass(c1)
    test(c2.s == s1)
    test(c3.s == s1)

    cseq1 = [c1]
    cseq2, cseq3 = i4.opMyClassSeq(cseq1)
    test(cseq2[0].s == s1)
    test(cseq3[0].s == s1)

    cmap1 = {}
    cmap1["a"] = c1
    cmap2, cmap3 = i4.opMyClassMap(cmap1)
    test(cmap2["a"].s == s1)
    test(cmap3["a"].s == s1)

    i1.shutdown()
    puts "ok"

end
