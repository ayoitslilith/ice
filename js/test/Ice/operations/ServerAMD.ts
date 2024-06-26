//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

import { Ice } from "ice";
import { Test } from "./Test.js";
import { TestHelper } from "../../Common/TestHelper.js";
import { AMDMyDerivedClassI } from "./AMDMyDerivedClassI.js";

export class ServerAMD extends TestHelper {
    async run(args: string[]) {
        let communicator: Ice.Communicator | null = null;
        let echo: Test.EchoPrx | null = null;
        try {
            const [properties] = this.createTestProperties(args);
            properties.setProperty("Ice.BatchAutoFlushSize", "100");
            [communicator] = this.initialize(properties);
            echo = new Test.EchoPrx(communicator, `__echo:${this.getTestEndpoint()}`);
            const adapter = await communicator.createObjectAdapter("");
            adapter.add(new AMDMyDerivedClassI(echo.ice_getEndpoints()), Ice.stringToIdentity("test"));
            await echo.setConnection();
            echo.ice_getCachedConnection().setAdapter(adapter);
            this.serverReady();
            await communicator.waitForShutdown();
        } finally {
            if (echo) {
                await echo.shutdown();
            }

            if (communicator) {
                await communicator.destroy();
            }
        }
    }
}
