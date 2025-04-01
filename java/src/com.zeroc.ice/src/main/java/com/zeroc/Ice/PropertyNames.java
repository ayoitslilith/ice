// Copyright (c) ZeroC, Inc.

// Generated by makeprops.py from PropertyNames.xml

// IMPORTANT: Do not edit this file -- any edits made here will be lost!

package com.zeroc.Ice;

final class PropertyNames
{
    public static final PropertyArray ProxyProps = new PropertyArray(
        "Proxy",
        false,
        false,
        new Property[]{
            new Property("EndpointSelection", false, "", false, null),
            new Property("ConnectionCached", false, "", false, null),
            new Property("PreferSecure", false, "", false, null),
            new Property("LocatorCacheTimeout", false, "", false, null),
            new Property("InvocationTimeout", false, "", false, null),
            new Property("Locator", false, "", false, PropertyNames.ProxyProps),
            new Property("Router", false, "", false, PropertyNames.ProxyProps),
            new Property("CollocationOptimized", false, "", false, null),
            new Property("Context\\.[^\\s]+", true, "", false, null)
        });

    public static final PropertyArray ConnectionProps = new PropertyArray(
        "Connection",
        true,
        false,
        new Property[]{
            new Property("CloseTimeout", false, "10", false, null),
            new Property("ConnectTimeout", false, "10", false, null),
            new Property("EnableIdleCheck", false, "1", false, null),
            new Property("IdleTimeout", false, "60", false, null),
            new Property("InactivityTimeout", false, "300", false, null),
            new Property("MaxDispatches", false, "100", false, null)
        });

    public static final PropertyArray ThreadPoolProps = new PropertyArray(
        "ThreadPool",
        true,
        false,
        new Property[]{
            new Property("Size", false, "1", false, null),
            new Property("SizeMax", false, "", false, null),
            new Property("SizeWarn", false, "0", false, null),
            new Property("StackSize", false, "0", false, null),
            new Property("Serialize", false, "0", false, null),
            new Property("ThreadIdleTime", false, "60", false, null),
            new Property("ThreadPriority", false, "", false, null)
        });

    public static final PropertyArray ObjectAdapterProps = new PropertyArray(
        "ObjectAdapter",
        true,
        false,
        new Property[]{
            new Property("AdapterId", false, "", false, null),
            new Property("Connection", false, "", false, PropertyNames.ConnectionProps),
            new Property("Endpoints", false, "", false, null),
            new Property("Locator", false, "", false, PropertyNames.ProxyProps),
            new Property("PublishedEndpoints", false, "", false, null),
            new Property("PublishedHost", false, "", false, null),
            new Property("ReplicaGroupId", false, "", false, null),
            new Property("Router", false, "", false, PropertyNames.ProxyProps),
            new Property("ProxyOptions", false, "", false, null),
            new Property("ThreadPool", false, "", false, PropertyNames.ThreadPoolProps),
            new Property("MaxConnections", false, "0", false, null),
            new Property("MessageSizeMax", false, "", false, null)
        });

    public static final PropertyArray LMDBProps = new PropertyArray(
        "LMDB",
        true,
        false,
        new Property[]{
        });

    public static final PropertyArray IceProps = new PropertyArray(
        "Ice",
        false,
        false,
        new Property[]{
            new Property("AcceptClassCycles", false, "0", false, null),
            new Property("Admin", false, "", false, PropertyNames.ObjectAdapterProps),
            new Property("Admin.DelayCreation", false, "0", false, null),
            new Property("Admin.Enabled", false, "", false, null),
            new Property("Admin.Facets", false, "", false, null),
            new Property("Admin.InstanceName", false, "", false, null),
            new Property("Admin.Logger.KeepLogs", false, "100", false, null),
            new Property("Admin.Logger.KeepTraces", false, "100", false, null),
            new Property("Admin.Logger.Properties", false, "", false, null),
            new Property("Admin.ServerId", false, "", false, null),
            new Property("BackgroundLocatorCacheUpdates", false, "0", false, null),
            new Property("BatchAutoFlush", false, "", true, null),
            new Property("BatchAutoFlushSize", false, "1024", false, null),
            new Property("ClassGraphDepthMax", false, "10", false, null),
            new Property("Compression.Level", false, "1", false, null),
            new Property("Config", false, "", false, null),
            new Property("Connection.Client", false, "", false, PropertyNames.ConnectionProps),
            new Property("Connection.Server", false, "", false, PropertyNames.ConnectionProps),
            new Property("Default.CollocationOptimized", false, "1", false, null),
            new Property("Default.EncodingVersion", false, "1.1", false, null),
            new Property("Default.EndpointSelection", false, "Random", false, null),
            new Property("Default.Host", false, "", false, null),
            new Property("Default.Locator", false, "", false, PropertyNames.ProxyProps),
            new Property("Default.LocatorCacheTimeout", false, "-1", false, null),
            new Property("Default.InvocationTimeout", false, "-1", false, null),
            new Property("Default.Package", false, "", false, null),
            new Property("Default.PreferSecure", false, "0", false, null),
            new Property("Default.Protocol", false, "tcp", false, null),
            new Property("Default.Router", false, "", false, PropertyNames.ProxyProps),
            new Property("Default.SlicedFormat", false, "0", false, null),
            new Property("Default.SourceAddress", false, "", false, null),
            new Property("HTTPProxyHost", false, "", false, null),
            new Property("HTTPProxyPort", false, "1080", false, null),
            new Property("ImplicitContext", false, "None", false, null),
            new Property("InitPlugins", false, "1", false, null),
            new Property("IPv4", false, "1", false, null),
            new Property("IPv6", false, "1", false, null),
            new Property("LogFile", false, "", false, null),
            new Property("MessageSizeMax", false, "1024", false, null),
            new Property("Override.Compress", false, "", false, null),
            new Property("Override.Secure", false, "", false, null),
            new Property("Package\\.[^\\s]+", true, "", false, null),
            new Property("Plugin\\.[^\\s]+", true, "", false, null),
            new Property("PluginLoadOrder", false, "", false, null),
            new Property("PreferIPv6Address", false, "0", false, null),
            new Property("PrintAdapterReady", false, "", false, null),
            new Property("ProgramName", false, "", false, null),
            new Property("RetryIntervals", false, "0", false, null),
            new Property("ServerIdleTime", false, "0", false, null),
            new Property("SOCKSProxyHost", false, "", false, null),
            new Property("SOCKSProxyPort", false, "1080", false, null),
            new Property("StdErr", false, "", false, null),
            new Property("StdOut", false, "", false, null),
            new Property("SyslogFacility", false, "LOG_USER", false, null),
            new Property("SyslogHost", false, "localhost", false, null),
            new Property("SyslogPort", false, "514", false, null),
            new Property("ThreadPool.Client", false, "", false, PropertyNames.ThreadPoolProps),
            new Property("ThreadPool.Server", false, "", false, PropertyNames.ThreadPoolProps),
            new Property("ThreadPriority", false, "", false, null),
            new Property("ToStringMode", false, "Unicode", false, null),
            new Property("Trace.Admin.Properties", false, "0", false, null),
            new Property("Trace.Admin.Logger", false, "0", false, null),
            new Property("Trace.Dispatch", false, "0", false, null),
            new Property("Trace.Locator", false, "0", false, null),
            new Property("Trace.Network", false, "0", false, null),
            new Property("Trace.Protocol", false, "0", false, null),
            new Property("Trace.Retry", false, "0", false, null),
            new Property("Trace.Slicing", false, "0", false, null),
            new Property("Trace.ThreadPool", false, "0", false, null),
            new Property("UDP.RcvSize", false, "", false, null),
            new Property("UDP.SndSize", false, "", false, null),
            new Property("TCP.Backlog", false, "511", false, null),
            new Property("TCP.RcvSize", false, "", false, null),
            new Property("TCP.SndSize", false, "", false, null),
            new Property("UseSyslog", false, "0", false, null),
            new Property("Warn.AMICallback", false, "1", false, null),
            new Property("Warn.Connections", false, "0", false, null),
            new Property("Warn.Datagrams", false, "0", false, null),
            new Property("Warn.Dispatch", false, "1", false, null),
            new Property("Warn.Endpoints", false, "1", false, null),
            new Property("Warn.Executor", false, "1", false, null),
            new Property("Warn.UnusedProperties", false, "0", false, null),
            new Property("CacheMessageBuffers", false, "2", false, null)
        });

    public static final PropertyArray IceMXProps = new PropertyArray(
        "IceMX",
        false,
        false,
        new Property[]{
            new Property("Metrics\\.[^\\s]+\\.GroupBy", true, "", false, null),
            new Property("Metrics\\.[^\\s]+\\.Map", true, "", false, null),
            new Property("Metrics\\.[^\\s]+\\.RetainDetached", true, "10", false, null),
            new Property("Metrics\\.[^\\s]+\\.Accept", true, "", false, null),
            new Property("Metrics\\.[^\\s]+\\.Reject", true, "", false, null),
            new Property("Metrics\\.[^\\s]+", true, "", false, null)
        });

    public static final PropertyArray IceDiscoveryProps = new PropertyArray(
        "IceDiscovery",
        false,
        false,
        new Property[]{
            new Property("Multicast", false, "", false, PropertyNames.ObjectAdapterProps),
            new Property("Reply", false, "", false, PropertyNames.ObjectAdapterProps),
            new Property("Locator", false, "", false, PropertyNames.ObjectAdapterProps),
            new Property("Lookup", false, "", false, null),
            new Property("Timeout", false, "300", false, null),
            new Property("RetryCount", false, "3", false, null),
            new Property("LatencyMultiplier", false, "1", false, null),
            new Property("Address", false, "", false, null),
            new Property("Port", false, "4061", false, null),
            new Property("Interface", false, "", false, null),
            new Property("DomainId", false, "", false, null)
        });

    public static final PropertyArray IceLocatorDiscoveryProps = new PropertyArray(
        "IceLocatorDiscovery",
        false,
        false,
        new Property[]{
            new Property("Reply", false, "", false, PropertyNames.ObjectAdapterProps),
            new Property("Locator", false, "", false, PropertyNames.ObjectAdapterProps),
            new Property("Lookup", false, "", false, null),
            new Property("Timeout", false, "300", false, null),
            new Property("RetryCount", false, "3", false, null),
            new Property("RetryDelay", false, "2000", false, null),
            new Property("Address", false, "", false, null),
            new Property("Port", false, "4061", false, null),
            new Property("Interface", false, "", false, null),
            new Property("InstanceName", false, "", false, null),
            new Property("Trace.Lookup", false, "0", false, null)
        });

    public static final PropertyArray IceBoxProps = new PropertyArray(
        "IceBox",
        false,
        true,
        new Property[]{
            new Property("InheritProperties", false, "", false, null),
            new Property("LoadOrder", false, "", false, null),
            new Property("PrintServicesReady", false, "", false, null),
            new Property("Service\\.[^\\s]+", true, "", false, null),
            new Property("Trace.ServiceObserver", false, "", false, null),
            new Property("UseSharedCommunicator\\.[^\\s]+", true, "", false, null)
        });

    public static final PropertyArray IceBoxAdminProps = new PropertyArray(
        "IceBoxAdmin",
        false,
        true,
        new Property[]{
            new Property("ServiceManager.Proxy", false, "", false, PropertyNames.ProxyProps)
        });

    public static final PropertyArray IceBridgeProps = new PropertyArray(
        "IceBridge",
        false,
        true,
        new Property[]{
        });

    public static final PropertyArray IceGridAdminProps = new PropertyArray(
        "IceGridAdmin",
        false,
        true,
        new Property[]{
            new Property("MetricsConfig", false, "", false, null),
            new Property("Trace.Observers", false, "", false, null),
            new Property("Trace.SaveToRegistry", false, "", false, null)
        });

    public static final PropertyArray IceGridProps = new PropertyArray(
        "IceGrid",
        false,
        true,
        new Property[]{
        });

    public static final PropertyArray IceSSLProps = new PropertyArray(
        "IceSSL",
        false,
        false,
        new Property[]{
            new Property("Alias", false, "", false, null),
            new Property("CheckCertName", false, "0", false, null),
            new Property("DefaultDir", false, "", false, null),
            new Property("Keystore", false, "", false, null),
            new Property("KeystorePassword", false, "", false, null),
            new Property("KeystoreType", false, "", false, null),
            new Property("Password", false, "", false, null),
            new Property("Trace.Security", false, "0", false, null),
            new Property("TrustOnly", false, "", false, null),
            new Property("TrustOnly.Client", false, "", false, null),
            new Property("TrustOnly.Server", false, "", false, null),
            new Property("TrustOnly\\.Server\\.[^\\s]+", true, "", false, null),
            new Property("Truststore", false, "", false, null),
            new Property("TruststorePassword", false, "", false, null),
            new Property("TruststoreType", false, "JKS", false, null),
            new Property("UsePlatformCAs", false, "0", false, null),
            new Property("VerifyPeer", false, "2", false, null)
        });

    public static final PropertyArray IceStormProps = new PropertyArray(
        "IceStorm",
        false,
        true,
        new Property[]{
        });

    public static final PropertyArray IceStormAdminProps = new PropertyArray(
        "IceStormAdmin",
        false,
        true,
        new Property[]{
        });

    public static final PropertyArray IceBTProps = new PropertyArray(
        "IceBT",
        false,
        false,
        new Property[]{
            new Property("RcvSize", false, "", false, null),
            new Property("SndSize", false, "", false, null)
        });

    public static final PropertyArray Glacier2Props = new PropertyArray(
        "Glacier2",
        false,
        true,
        new Property[]{
        });

    public static final PropertyArray DataStormProps = new PropertyArray(
        "DataStorm",
        false,
        true,
        new Property[]{
        });

    public static final PropertyArray validProps[] =
    {
        IceProps,
        IceMXProps,
        IceDiscoveryProps,
        IceLocatorDiscoveryProps,
        IceBoxProps,
        IceBoxAdminProps,
        IceBridgeProps,
        IceGridAdminProps,
        IceGridProps,
        IceSSLProps,
        IceStormProps,
        IceStormAdminProps,
        IceBTProps,
        Glacier2Props,
        DataStormProps
    };

    private PropertyNames() {
    }
}
