% Copyright (c) ZeroC, Inc.

function client(args)
    addpath('generated');
    if ~libisloaded('ice')
        loadlibrary('ice', @iceproto)
    end

    helper = TestHelper();
    properties = helper.createTestProperties(args);
    properties.setProperty('Ice.Warn.Connections', '0');
    communicator = helper.initialize(properties);
    cleanup = onCleanup(@() communicator.destroy());

    %
    % Remote tests
    %
    vfm = communicator.getValueFactoryManager();
    vfm.add(@(id) BI(), Test.B.ice_staticId());
    vfm.add(@(id) CI(), Test.C.ice_staticId());
    vfm.add(@(id) DI(), Test.D.ice_staticId());

    initial = AllTests.allTests(helper);
    initial.shutdown();

    %
    % Local tests
    %
    vfm.add(@(id) CB1I(), LocalTest.CB1.ice_staticId());
    vfm.add(@(id) CB2I(), LocalTest.CB2.ice_staticId());
    vfm.add(@(id) CB3I(), LocalTest.CB3.ice_staticId());
    vfm.add(@(id) CB4I(), LocalTest.CB4.ice_staticId());
    vfm.add(@(id) CB5I(), LocalTest.CB5.ice_staticId());
    vfm.add(@(id) CB6I(), LocalTest.CB6.ice_staticId());
    vfm.add(@(id) CB7I(), LocalTest.CB7.ice_staticId());
    vfm.add(@(id) CB8I(), LocalTest.CB8.ice_staticId());
    LocalTests.localTests(helper);

    clear('classes'); % Avoids conflicts with tests that define the same symbols.
end
