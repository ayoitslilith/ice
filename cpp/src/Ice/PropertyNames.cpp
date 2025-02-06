
// Copyright (c) ZeroC, Inc.

// Generated by makeprops.py from PropertyNames.xml

// IMPORTANT: Do not edit this file -- any edits made here will be lost!

#include "PropertyNames.h"

using namespace IceInternal;

const Property ProxyPropsData[] =
{
    Property{"EndpointSelection", "", false, false, nullptr},
    Property{"ConnectionCached", "", false, false, nullptr},
    Property{"PreferSecure", "", false, false, nullptr},
    Property{"LocatorCacheTimeout", "", false, false, nullptr},
    Property{"InvocationTimeout", "", false, false, nullptr},
    Property{"Locator", "", false, false, &PropertyNames::ProxyProps},
    Property{"Router", "", false, false, &PropertyNames::ProxyProps},
    Property{"CollocationOptimized", "", false, false, nullptr},
    Property{"Context.*", "", true, false, nullptr}
};

const PropertyArray PropertyNames::ProxyProps
{
    .name="Proxy",
    .prefixOnly=false,
    .isOptIn=false,
    .properties=ProxyPropsData,
    .length=9
};

const Property ConnectionPropsData[] =
{
    Property{"CloseTimeout", "10", false, false, nullptr},
    Property{"ConnectTimeout", "10", false, false, nullptr},
    Property{"EnableIdleCheck", "1", false, false, nullptr},
    Property{"IdleTimeout", "60", false, false, nullptr},
    Property{"InactivityTimeout", "300", false, false, nullptr},
    Property{"MaxDispatches", "100", false, false, nullptr}
};

const PropertyArray PropertyNames::ConnectionProps
{
    .name="Connection",
    .prefixOnly=true,
    .isOptIn=false,
    .properties=ConnectionPropsData,
    .length=6
};

const Property ThreadPoolPropsData[] =
{
    Property{"Size", "1", false, false, nullptr},
    Property{"SizeMax", "", false, false, nullptr},
    Property{"SizeWarn", "0", false, false, nullptr},
    Property{"Serialize", "0", false, false, nullptr},
    Property{"ThreadIdleTime", "60", false, false, nullptr}
};

const PropertyArray PropertyNames::ThreadPoolProps
{
    .name="ThreadPool",
    .prefixOnly=true,
    .isOptIn=false,
    .properties=ThreadPoolPropsData,
    .length=5
};

const Property ObjectAdapterPropsData[] =
{
    Property{"AdapterId", "", false, false, nullptr},
    Property{"Connection", "", false, false, &PropertyNames::ConnectionProps},
    Property{"Endpoints", "", false, false, nullptr},
    Property{"Locator", "", false, false, &PropertyNames::ProxyProps},
    Property{"PublishedEndpoints", "", false, false, nullptr},
    Property{"PublishedHost", "", false, false, nullptr},
    Property{"ReplicaGroupId", "", false, false, nullptr},
    Property{"Router", "", false, false, &PropertyNames::ProxyProps},
    Property{"ProxyOptions", "", false, false, nullptr},
    Property{"ThreadPool", "", false, false, &PropertyNames::ThreadPoolProps},
    Property{"MaxConnections", "0", false, false, nullptr},
    Property{"MessageSizeMax", "", false, false, nullptr}
};

const PropertyArray PropertyNames::ObjectAdapterProps
{
    .name="ObjectAdapter",
    .prefixOnly=true,
    .isOptIn=false,
    .properties=ObjectAdapterPropsData,
    .length=12
};

const Property LMDBPropsData[] =
{
    Property{"Path", "", false, false, nullptr},
    Property{"MapSize", "", false, false, nullptr}
};

const PropertyArray PropertyNames::LMDBProps
{
    .name="LMDB",
    .prefixOnly=true,
    .isOptIn=false,
    .properties=LMDBPropsData,
    .length=2
};

const Property IcePropsData[] =
{
    Property{"AcceptClassCycles", "0", false, false, nullptr},
    Property{"Admin", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"Admin.DelayCreation", "0", false, false, nullptr},
    Property{"Admin.Enabled", "", false, false, nullptr},
    Property{"Admin.Facets", "", false, false, nullptr},
    Property{"Admin.InstanceName", "", false, false, nullptr},
    Property{"Admin.Logger.KeepLogs", "100", false, false, nullptr},
    Property{"Admin.Logger.KeepTraces", "100", false, false, nullptr},
    Property{"Admin.Logger.Properties", "", false, false, nullptr},
    Property{"Admin.ServerId", "", false, false, nullptr},
    Property{"BackgroundLocatorCacheUpdates", "0", false, false, nullptr},
    Property{"BatchAutoFlush", "", false, true, nullptr},
    Property{"BatchAutoFlushSize", "1024", false, false, nullptr},
    Property{"ClassGraphDepthMax", "10", false, false, nullptr},
    Property{"Compression.Level", "1", false, false, nullptr},
    Property{"Config", "", false, false, nullptr},
    Property{"Connection.Client", "", false, false, &PropertyNames::ConnectionProps},
    Property{"Connection.Server", "", false, false, &PropertyNames::ConnectionProps},
    Property{"Default.CollocationOptimized", "1", false, false, nullptr},
    Property{"Default.EncodingVersion", "1.1", false, false, nullptr},
    Property{"Default.EndpointSelection", "Random", false, false, nullptr},
    Property{"Default.Host", "", false, false, nullptr},
    Property{"Default.Locator", "", false, false, &PropertyNames::ProxyProps},
    Property{"Default.LocatorCacheTimeout", "-1", false, false, nullptr},
    Property{"Default.InvocationTimeout", "-1", false, false, nullptr},
    Property{"Default.PreferSecure", "0", false, false, nullptr},
    Property{"Default.Protocol", "tcp", false, false, nullptr},
    Property{"Default.Router", "", false, false, &PropertyNames::ProxyProps},
    Property{"Default.SlicedFormat", "0", false, false, nullptr},
    Property{"Default.SourceAddress", "", false, false, nullptr},
    Property{"EventLog.Source", "", false, false, nullptr},
    Property{"HTTPProxyHost", "", false, false, nullptr},
    Property{"HTTPProxyPort", "1080", false, false, nullptr},
    Property{"ImplicitContext", "None", false, false, nullptr},
    Property{"InitPlugins", "1", false, false, nullptr},
    Property{"IPv4", "1", false, false, nullptr},
    Property{"IPv6", "1", false, false, nullptr},
    Property{"LogFile", "", false, false, nullptr},
    Property{"LogFile.SizeMax", "0", false, false, nullptr},
    Property{"LogStdErr.Convert", "1", false, false, nullptr},
    Property{"MessageSizeMax", "1024", false, false, nullptr},
    Property{"Nohup", "1", false, false, nullptr},
    Property{"Override.Compress", "", false, false, nullptr},
    Property{"Override.Secure", "", false, false, nullptr},
    Property{"Plugin.*", "", true, false, nullptr},
    Property{"PluginLoadOrder", "", false, false, nullptr},
    Property{"PreferIPv6Address", "0", false, false, nullptr},
    Property{"PrintAdapterReady", "", false, false, nullptr},
    Property{"PrintProcessId", "", false, false, nullptr},
    Property{"PrintStackTraces", "0", false, false, nullptr},
    Property{"ProgramName", "", false, false, nullptr},
    Property{"RetryIntervals", "0", false, false, nullptr},
    Property{"ServerIdleTime", "0", false, false, nullptr},
    Property{"SOCKSProxyHost", "", false, false, nullptr},
    Property{"SOCKSProxyPort", "1080", false, false, nullptr},
    Property{"StdErr", "", false, false, nullptr},
    Property{"StdOut", "", false, false, nullptr},
    Property{"SyslogFacility", "LOG_USER", false, false, nullptr},
    Property{"ThreadPool.Client", "", false, false, &PropertyNames::ThreadPoolProps},
    Property{"ThreadPool.Server", "", false, false, &PropertyNames::ThreadPoolProps},
    Property{"ToStringMode", "Unicode", false, false, nullptr},
    Property{"Trace.Admin.Properties", "0", false, false, nullptr},
    Property{"Trace.Admin.Logger", "0", false, false, nullptr},
    Property{"Trace.Dispatch", "0", false, false, nullptr},
    Property{"Trace.Locator", "0", false, false, nullptr},
    Property{"Trace.Network", "0", false, false, nullptr},
    Property{"Trace.Protocol", "0", false, false, nullptr},
    Property{"Trace.Retry", "0", false, false, nullptr},
    Property{"Trace.Slicing", "0", false, false, nullptr},
    Property{"Trace.ThreadPool", "0", false, false, nullptr},
    Property{"UDP.RcvSize", "", false, false, nullptr},
    Property{"UDP.SndSize", "", false, false, nullptr},
    Property{"TCP.Backlog", "511", false, false, nullptr},
    Property{"TCP.RcvSize", "", false, false, nullptr},
    Property{"TCP.SndSize", "", false, false, nullptr},
    Property{"UseOSLog", "0", false, false, nullptr},
    Property{"UseSyslog", "0", false, false, nullptr},
    Property{"UseSystemdJournal", "0", false, false, nullptr},
    Property{"Warn.AMICallback", "1", false, false, nullptr},
    Property{"Warn.Connections", "0", false, false, nullptr},
    Property{"Warn.Datagrams", "0", false, false, nullptr},
    Property{"Warn.Dispatch", "1", false, false, nullptr},
    Property{"Warn.Endpoints", "1", false, false, nullptr},
    Property{"Warn.Executor", "1", false, false, nullptr},
    Property{"Warn.UnusedProperties", "0", false, false, nullptr}
};

const PropertyArray PropertyNames::IceProps
{
    .name="Ice",
    .prefixOnly=false,
    .isOptIn=false,
    .properties=IcePropsData,
    .length=85
};

const Property IceMXPropsData[] =
{
    Property{"Metrics.*.GroupBy", "", true, false, nullptr},
    Property{"Metrics.*.Map", "", true, false, nullptr},
    Property{"Metrics.*.RetainDetached", "10", true, false, nullptr},
    Property{"Metrics.*.Accept", "", true, false, nullptr},
    Property{"Metrics.*.Reject", "", true, false, nullptr},
    Property{"Metrics.*", "", true, false, nullptr}
};

const PropertyArray PropertyNames::IceMXProps
{
    .name="IceMX",
    .prefixOnly=false,
    .isOptIn=false,
    .properties=IceMXPropsData,
    .length=6
};

const Property IceDiscoveryPropsData[] =
{
    Property{"Multicast", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"Reply", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"Locator", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"Lookup", "", false, false, nullptr},
    Property{"Timeout", "300", false, false, nullptr},
    Property{"RetryCount", "3", false, false, nullptr},
    Property{"LatencyMultiplier", "1", false, false, nullptr},
    Property{"Address", "", false, false, nullptr},
    Property{"Port", "4061", false, false, nullptr},
    Property{"Interface", "", false, false, nullptr},
    Property{"DomainId", "", false, false, nullptr}
};

const PropertyArray PropertyNames::IceDiscoveryProps
{
    .name="IceDiscovery",
    .prefixOnly=false,
    .isOptIn=false,
    .properties=IceDiscoveryPropsData,
    .length=11
};

const Property IceLocatorDiscoveryPropsData[] =
{
    Property{"Reply", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"Locator", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"Lookup", "", false, false, nullptr},
    Property{"Timeout", "300", false, false, nullptr},
    Property{"RetryCount", "3", false, false, nullptr},
    Property{"RetryDelay", "2000", false, false, nullptr},
    Property{"Address", "", false, false, nullptr},
    Property{"Port", "4061", false, false, nullptr},
    Property{"Interface", "", false, false, nullptr},
    Property{"InstanceName", "", false, false, nullptr},
    Property{"Trace.Lookup", "0", false, false, nullptr}
};

const PropertyArray PropertyNames::IceLocatorDiscoveryProps
{
    .name="IceLocatorDiscovery",
    .prefixOnly=false,
    .isOptIn=false,
    .properties=IceLocatorDiscoveryPropsData,
    .length=11
};

const Property IceBoxPropsData[] =
{
    Property{"InheritProperties", "", false, false, nullptr},
    Property{"LoadOrder", "", false, false, nullptr},
    Property{"PrintServicesReady", "", false, false, nullptr},
    Property{"Service.*", "", true, false, nullptr},
    Property{"Trace.ServiceObserver", "", false, false, nullptr},
    Property{"UseSharedCommunicator.*", "", true, false, nullptr}
};

const PropertyArray PropertyNames::IceBoxProps
{
    .name="IceBox",
    .prefixOnly=false,
    .isOptIn=true,
    .properties=IceBoxPropsData,
    .length=6
};

const Property IceBoxAdminPropsData[] =
{
    Property{"ServiceManager.Proxy", "", false, false, &PropertyNames::ProxyProps}
};

const PropertyArray PropertyNames::IceBoxAdminProps
{
    .name="IceBoxAdmin",
    .prefixOnly=false,
    .isOptIn=true,
    .properties=IceBoxAdminPropsData,
    .length=1
};

const Property IceBridgePropsData[] =
{
    Property{"Source", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"Target.Endpoints", "", false, false, nullptr},
    Property{"InstanceName", "IceBridge", false, false, nullptr}
};

const PropertyArray PropertyNames::IceBridgeProps
{
    .name="IceBridge",
    .prefixOnly=false,
    .isOptIn=true,
    .properties=IceBridgePropsData,
    .length=3
};

const Property IceGridAdminPropsData[] =
{
    Property{"AuthenticateUsingSSL", "", false, false, nullptr},
    Property{"Username", "", false, false, nullptr},
    Property{"Password", "", false, false, nullptr},
    Property{"Replica", "", false, false, nullptr},
    Property{"Host", "", false, false, nullptr},
    Property{"Port", "", false, false, nullptr},
    Property{"InstanceName", "", false, false, nullptr},
    Property{"Server", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"Discovery.Address", "", false, false, nullptr},
    Property{"Discovery.Interface", "", false, false, nullptr},
    Property{"Discovery.Lookup", "", false, false, nullptr},
    Property{"Discovery.Reply", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"Discovery.Locator", "", false, false, &PropertyNames::ObjectAdapterProps}
};

const PropertyArray PropertyNames::IceGridAdminProps
{
    .name="IceGridAdmin",
    .prefixOnly=false,
    .isOptIn=true,
    .properties=IceGridAdminPropsData,
    .length=13
};

const Property IceGridPropsData[] =
{
    Property{"AdminRouter", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"InstanceName", "", false, false, nullptr},
    Property{"Node", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"Node.AllowRunningServersAsRoot", "", false, false, nullptr},
    Property{"Node.AllowEndpointsOverride", "0", false, false, nullptr},
    Property{"Node.CollocateRegistry", "", false, false, nullptr},
    Property{"Node.Data", "", false, false, nullptr},
    Property{"Node.DisableOnFailure", "0", false, false, nullptr},
    Property{"Node.Name", "", false, false, nullptr},
    Property{"Node.Output", "", false, false, nullptr},
    Property{"Node.ProcessorSocketCount", "", false, false, nullptr},
    Property{"Node.PrintServersReady", "", false, false, nullptr},
    Property{"Node.PropertiesOverride", "", false, false, nullptr},
    Property{"Node.RedirectErrToOut", "0", false, false, nullptr},
    Property{"Node.Trace.Activator", "0", false, false, nullptr},
    Property{"Node.Trace.Adapter", "0", false, false, nullptr},
    Property{"Node.Trace.Admin", "0", false, false, nullptr},
    Property{"Node.Trace.Patch", "0", false, false, nullptr},
    Property{"Node.Trace.Replica", "0", false, false, nullptr},
    Property{"Node.Trace.Server", "0", false, false, nullptr},
    Property{"Node.UserAccounts", "", false, false, nullptr},
    Property{"Node.UserAccountMapper", "", false, false, &PropertyNames::ProxyProps},
    Property{"Node.WaitTime", "60", false, false, nullptr},
    Property{"Registry.AdminCryptPasswords", "", false, false, nullptr},
    Property{"Registry.AdminPermissionsVerifier", "", false, false, &PropertyNames::ProxyProps},
    Property{"Registry.AdminSessionFilters", "0", false, false, nullptr},
    Property{"Registry.AdminSessionManager", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"Registry.AdminSSLPermissionsVerifier", "", false, false, &PropertyNames::ProxyProps},
    Property{"Registry.Client", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"Registry.CryptPasswords", "", false, false, nullptr},
    Property{"Registry.DefaultTemplates", "", false, false, nullptr},
    Property{"Registry.Discovery", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"Registry.Discovery.Enabled", "1", false, false, nullptr},
    Property{"Registry.Discovery.Address", "", false, false, nullptr},
    Property{"Registry.Discovery.Port", "4061", false, false, nullptr},
    Property{"Registry.Discovery.Interface", "", false, false, nullptr},
    Property{"Registry.DynamicRegistration", "", false, false, nullptr},
    Property{"Registry.Internal", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"Registry.LMDB", "", false, false, &PropertyNames::LMDBProps},
    Property{"Registry.NodeSessionTimeout", "30", false, false, nullptr},
    Property{"Registry.PermissionsVerifier", "", false, false, &PropertyNames::ProxyProps},
    Property{"Registry.ReplicaName", "Master", false, false, nullptr},
    Property{"Registry.ReplicaSessionTimeout", "30", false, false, nullptr},
    Property{"Registry.Server", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"Registry.SessionFilters", "0", false, false, nullptr},
    Property{"Registry.SessionManager", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"Registry.SSLPermissionsVerifier", "", false, false, &PropertyNames::ProxyProps},
    Property{"Registry.Trace.Admin", "0", false, false, nullptr},
    Property{"Registry.Trace.Application", "0", false, false, nullptr},
    Property{"Registry.Trace.Adapter", "0", false, false, nullptr},
    Property{"Registry.Trace.Discovery", "0", false, false, nullptr},
    Property{"Registry.Trace.Locator", "0", false, false, nullptr},
    Property{"Registry.Trace.Node", "0", false, false, nullptr},
    Property{"Registry.Trace.Object", "0", false, false, nullptr},
    Property{"Registry.Trace.Patch", "0", false, false, nullptr},
    Property{"Registry.Trace.Replica", "0", false, false, nullptr},
    Property{"Registry.Trace.Server", "0", false, false, nullptr},
    Property{"Registry.Trace.Session", "0", false, false, nullptr},
    Property{"Registry.Trace.Subscriber", "0", false, false, nullptr},
    Property{"Registry.Trace.Topic", "0", false, false, nullptr},
    Property{"Registry.Trace.TopicManager", "0", false, false, nullptr},
    Property{"Registry.UserAccounts", "", false, false, nullptr}
};

const PropertyArray PropertyNames::IceGridProps
{
    .name="IceGrid",
    .prefixOnly=false,
    .isOptIn=true,
    .properties=IceGridPropsData,
    .length=62
};

const Property IceSSLPropsData[] =
{
    Property{"CAs", "", false, false, nullptr},
    Property{"CertStore", "My", false, false, nullptr},
    Property{"CertStoreLocation", "CurrentUser", false, false, nullptr},
    Property{"CertFile", "", false, false, nullptr},
    Property{"CheckCertName", "0", false, false, nullptr},
    Property{"CertificateRevocationListFiles", "", false, false, nullptr},
    Property{"DefaultDir", "", false, false, nullptr},
    Property{"FindCert", "", false, false, nullptr},
    Property{"KeyFile", "", false, false, nullptr},
    Property{"Keychain", "", false, false, nullptr},
    Property{"KeychainPassword", "", false, false, nullptr},
    Property{"Password", "", false, false, nullptr},
    Property{"RevocationCheck", "0", false, false, nullptr},
    Property{"RevocationCheckCacheOnly", "0", false, false, nullptr},
    Property{"Trace.Security", "0", false, false, nullptr},
    Property{"TrustOnly", "", false, false, nullptr},
    Property{"TrustOnly.Client", "", false, false, nullptr},
    Property{"TrustOnly.Server", "", false, false, nullptr},
    Property{"TrustOnly.Server.*", "", true, false, nullptr},
    Property{"UsePlatformCAs", "0", false, false, nullptr},
    Property{"VerifyPeer", "2", false, false, nullptr}
};

const PropertyArray PropertyNames::IceSSLProps
{
    .name="IceSSL",
    .prefixOnly=false,
    .isOptIn=false,
    .properties=IceSSLPropsData,
    .length=21
};

const Property IceStormPropsData[] =
{
    Property{"Discard.Interval", "60", false, false, nullptr},
    Property{"Election.ElectionTimeout", "10", false, false, nullptr},
    Property{"Election.MasterTimeout", "10", false, false, nullptr},
    Property{"Election.ResponseTimeout", "10", false, false, nullptr},
    Property{"Flush.Timeout", "1000", false, false, nullptr},
    Property{"InstanceName", "IceStorm", false, false, nullptr},
    Property{"LMDB", "", false, false, &PropertyNames::LMDBProps},
    Property{"Node", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"NodeId", "-1", false, false, nullptr},
    Property{"Nodes.*", "", true, false, nullptr},
    Property{"Publish", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"ReplicatedPublishEndpoints", "", false, false, nullptr},
    Property{"ReplicatedTopicManagerEndpoints", "", false, false, nullptr},
    Property{"Send.QueueSizeMax", "-1", false, false, nullptr},
    Property{"Send.QueueSizeMaxPolicy", "", false, false, nullptr},
    Property{"Send.Timeout", "60000", false, false, nullptr},
    Property{"TopicManager.Proxy", "", false, false, &PropertyNames::ProxyProps},
    Property{"TopicManager", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"Trace.Election", "0", false, false, nullptr},
    Property{"Trace.Replication", "0", false, false, nullptr},
    Property{"Trace.Subscriber", "0", false, false, nullptr},
    Property{"Trace.Topic", "0", false, false, nullptr},
    Property{"Trace.TopicManager", "0", false, false, nullptr},
    Property{"Transient", "0", false, false, nullptr}
};

const PropertyArray PropertyNames::IceStormProps
{
    .name="IceStorm",
    .prefixOnly=false,
    .isOptIn=true,
    .properties=IceStormPropsData,
    .length=24
};

const Property IceStormAdminPropsData[] =
{
    Property{"TopicManager.*", "", true, false, nullptr},
    Property{"Host", "", false, false, nullptr},
    Property{"Port", "", false, false, nullptr}
};

const PropertyArray PropertyNames::IceStormAdminProps
{
    .name="IceStormAdmin",
    .prefixOnly=false,
    .isOptIn=true,
    .properties=IceStormAdminPropsData,
    .length=3
};

const Property IceBTPropsData[] =
{
    Property{"RcvSize", "", false, false, nullptr},
    Property{"SndSize", "", false, false, nullptr}
};

const PropertyArray PropertyNames::IceBTProps
{
    .name="IceBT",
    .prefixOnly=false,
    .isOptIn=false,
    .properties=IceBTPropsData,
    .length=2
};

const Property Glacier2PropsData[] =
{
    Property{"AddConnectionContext", "0", false, false, nullptr},
    Property{"Client", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"Client.ForwardContext", "0", false, false, nullptr},
    Property{"Client.Trace.Reject", "0", false, false, nullptr},
    Property{"Client.Trace.Request", "0", false, false, nullptr},
    Property{"CryptPasswords", "", false, false, nullptr},
    Property{"Filter.Address.Reject", "", false, false, nullptr},
    Property{"Filter.Address.Accept", "", false, false, nullptr},
    Property{"Filter.ProxySizeMax", "", false, false, nullptr},
    Property{"Filter.Category.Accept", "", false, false, nullptr},
    Property{"Filter.Category.AcceptUser", "", false, false, nullptr},
    Property{"Filter.AdapterId.Accept", "", false, false, nullptr},
    Property{"Filter.Identity.Accept", "", false, false, nullptr},
    Property{"InstanceName", "Glacier2", false, false, nullptr},
    Property{"PermissionsVerifier", "", false, false, &PropertyNames::ProxyProps},
    Property{"SSLPermissionsVerifier", "", false, false, &PropertyNames::ProxyProps},
    Property{"RoutingTable.MaxSize", "1000", false, false, nullptr},
    Property{"Server", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"Server.ForwardContext", "0", false, false, nullptr},
    Property{"Server.Trace.Request", "0", false, false, nullptr},
    Property{"SessionManager", "", false, false, &PropertyNames::ProxyProps},
    Property{"SSLSessionManager", "", false, false, &PropertyNames::ProxyProps},
    Property{"Trace.RoutingTable", "0", false, false, nullptr},
    Property{"Trace.Session", "0", false, false, nullptr}
};

const PropertyArray PropertyNames::Glacier2Props
{
    .name="Glacier2",
    .prefixOnly=false,
    .isOptIn=true,
    .properties=Glacier2PropsData,
    .length=24
};

const Property DataStormPropsData[] =
{
    Property{"Node.Name", "", false, false, nullptr},
    Property{"Node.ConnectTo", "", false, false, nullptr},
    Property{"Node.Multicast", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"Node.Multicast.Enabled", "1", false, false, nullptr},
    Property{"Node.Multicast.Proxy", "", false, false, &PropertyNames::ProxyProps},
    Property{"Node.RetryCount", "6", false, false, nullptr},
    Property{"Node.RetryDelay", "500", false, false, nullptr},
    Property{"Node.RetryMultiplier", "2", false, false, nullptr},
    Property{"Node.Server", "", false, false, &PropertyNames::ObjectAdapterProps},
    Property{"Node.Server.Enabled", "1", false, false, nullptr},
    Property{"Node.Server.ForwardDiscoveryToMulticast", "0", false, false, nullptr},
    Property{"Topic.ClearHistory", "OnAll", false, false, nullptr},
    Property{"Topic.DiscardPolicy", "Never", false, false, nullptr},
    Property{"Topic.Priority", "0", false, false, nullptr},
    Property{"Topic.SampleCount", "-1", false, false, nullptr},
    Property{"Topic.SampleLifetime", "0", false, false, nullptr},
    Property{"Trace.Data", "0", false, false, nullptr},
    Property{"Trace.Session", "0", false, false, nullptr},
    Property{"Trace.Topic", "0", false, false, nullptr}
};

const PropertyArray PropertyNames::DataStormProps
{
    .name="DataStorm",
    .prefixOnly=false,
    .isOptIn=true,
    .properties=DataStormPropsData,
    .length=19
};

const std::array<PropertyArray, 15> PropertyNames::validProps =
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
