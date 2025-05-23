% Copyright (c) ZeroC, Inc.

classdef AllTests
    methods(Static)
        function r = allTests(helper)
            import Test.*;
            import M.*;

            communicator = helper.communicator();
            ref = ['test:', helper.getTestEndpoint()];
            cl = MyClassPrx(communicator, ref);
            derived = MyDerivedClassPrx.checkedCast(cl);

            fprintf('testing twoway operations... ');
            Twoways.twoways(helper, cl);
            Twoways.twoways(helper, derived);
            derived.opDerived();
            fprintf('ok\n');

            fprintf('testing oneway operations... ');
            Oneways.oneways(cl);
            fprintf('ok\n');

            fprintf('testing twoway operations with AMI... ');
            TwowaysAMI.twowaysAMI(helper, cl);
            TwowaysAMI.twowaysAMI(helper, derived);
            fprintf('ok\n');

            fprintf('testing oneway operations with AMI... ');
            OnewaysAMI.onewaysAMI(cl);
            fprintf('ok\n');

            fprintf('testing batch oneway operations... ');
            BatchOneways.batchOneways(helper, cl);
            BatchOneways.batchOneways(helper, derived);
            fprintf('ok\n');

            fprintf('testing batch AMI oneway operations... ');
            BatchOnewaysAMI.batchOneways(cl);
            BatchOnewaysAMI.batchOneways(derived);
            fprintf('ok\n');

            r = cl;
        end
    end
end
