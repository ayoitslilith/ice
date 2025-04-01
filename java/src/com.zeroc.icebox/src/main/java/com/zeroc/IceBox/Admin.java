// Copyright (c) ZeroC, Inc.

package com.zeroc.IceBox;

import java.util.Collections;

public final class Admin {
    private static void usage() {
        System.err.println(
                "Usage: com.zeroc.IceBox.Admin [options] [command...]\n" +
                        "Options:\n" +
                        "-h, --help          Show this message.\n" +
                        "-v, --version       Display the Ice version.\n" +
                        "\n" +
                        "Commands:\n" +
                        "start SERVICE       Start a service.\n" +
                        "stop SERVICE        Stop a service.\n" +
                        "shutdown            Shutdown the server.");
    }

    public static void main(String[] args) {
        int status = 0;
        java.util.List<String> commands = new java.util.ArrayList<>();

        com.zeroc.Ice.InitializationData initData = new com.zeroc.Ice.InitializationData();
        initData.properties =
                new com.zeroc.Ice.Properties(Collections.singletonList("IceBoxAdmin"));

        try (com.zeroc.Ice.Communicator communicator =
                com.zeroc.Ice.Util.initialize(args, initData, commands)) {
            Runtime.getRuntime()
                    .addShutdownHook(
                            new Thread(
                                    () -> {
                                        communicator.destroy();
                                    }));

            status = run(communicator, commands);
        }

        System.exit(status);
    }

    public static int run(
            com.zeroc.Ice.Communicator communicator, java.util.List<String> commands) {
        if (commands.isEmpty()) {
            usage();
            return 0;
        }

        for (String command : commands) {
            if ("-h".equals(command) || "--help".equals(command)) {
                usage();
                return 0;
            } else if ("-v".equals(command) || "--version".equals(command)) {
                System.out.println(com.zeroc.Ice.Util.stringVersion());
                return 0;
            } else if (command.startsWith("-")) {
                System.err.println("IceBox.Admin: unknown option `" + command + "'");
                usage();
                return 1;
            }
        }

        com.zeroc.Ice.ObjectPrx base =
                communicator.propertyToProxy("IceBoxAdmin.ServiceManager.Proxy");

        if (base == null) {
            System.err.println(
                    "IceBox.Admin: property 'IceBoxAdmin.ServiceManager.Proxy' is not set");
            return 1;
        }

        com.zeroc.IceBox.ServiceManagerPrx manager =
                com.zeroc.IceBox.ServiceManagerPrx.checkedCast(base);
        if (manager == null) {
            System.err.println(
                    "IceBox.Admin: '" + base.toString() + "' is not an IceBox::ServiceManager");
            return 1;
        }

        for (int i = 0; i < commands.size(); i++) {
            String command = commands.get(i);
            if ("shutdown".equals(command)) {
                manager.shutdown();
            } else if ("start".equals(command)) {
                if (++i >= commands.size()) {
                    System.err.println("IceBox.Admin: no service name specified.");
                    return 1;
                }

                String service = commands.get(i);
                try {
                    manager.startService(service);
                } catch (com.zeroc.IceBox.NoSuchServiceException ex) {
                    System.err.println("IceBox.Admin: unknown service `" + service + "'");
                    return 1;
                } catch (com.zeroc.IceBox.AlreadyStartedException ex) {
                    System.err.println("IceBox.Admin: service already started.");
                }
            } else if ("stop".equals(command)) {
                if (++i >= commands.size()) {
                    System.err.println("IceBox.Admin: no service name specified.");
                    return 1;
                }

                String service = commands.get(i);
                try {
                    manager.stopService(service);
                } catch (com.zeroc.IceBox.NoSuchServiceException ex) {
                    System.err.println("IceBox.Admin: unknown service `" + service + "'");
                    return 1;
                } catch (com.zeroc.IceBox.AlreadyStoppedException ex) {
                    System.err.println("IceBox.Admin: service already stopped.");
                }
            } else {
                System.err.println("IceBox.Admin: unknown command `" + command + "'");
                usage();
                return 1;
            }
        }

        return 0;
    }
}
