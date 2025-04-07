// Copyright (c) ZeroC, Inc.

package com.zeroc.IceBT;

import com.zeroc.Ice.Communicator;
import com.zeroc.Ice.Plugin;

/** Creates IceBT plug-ins. */
public class PluginFactory implements com.zeroc.Ice.PluginFactory {
    /**
     * Returns a new IceBT plug-in.
     *
     * @param communicator The communicator for the plug-in.
     * @param name The name of the plug-in.
     * @param args The arguments that are specified in the plug-in's configuration.
     * @return The new plug-in. <code>null</code> can be returned to indicate that a general error
     *     occurred. Alternatively, <code>create</code> can throw PluginInitializationException to
     *     provide more detailed information.
     */
    @Override
    public Plugin create(
            Communicator communicator, String name, String[] args) {
        return new PluginI(communicator);
    }
}
