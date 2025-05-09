// Copyright (c) ZeroC, Inc.

package com.zeroc.IceGridGUI;

import com.zeroc.IceGridGUI.Application.TreeNode;

import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;
import javax.swing.Action;

/** Holds all actions for the Application view */
public class ApplicationActions {
    public Action get(int index) {
        return _array[index];
    }

    public boolean[] setTarget(TreeNode target) {
        _target = target;

        boolean[] availableActions;
        if (_target == null) {
            availableActions = new boolean[TreeNode.ACTION_COUNT];
        } else {
            availableActions = _target.getAvailableActions();
        }

        for (int i = 0; i < _array.length; i++) {
            _array[i].setEnabled(availableActions[i]);
        }

        return availableActions;
    }

    ApplicationActions(boolean popup) {
        _array[TreeNode.NEW_ADAPTER] =
            new AbstractAction(popup ? "New Adapter" : "Adapter") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    if (apply(_target)) {
                        _target.newAdapter();
                    }
                }
            };

        _array[TreeNode.NEW_NODE] =
            new AbstractAction(popup ? "New Node" : "Node") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    if (apply(_target)) {
                        _target.newNode();
                    }
                }
            };

        _array[TreeNode.NEW_PROPERTY_SET] =
            new AbstractAction(popup ? "New Property Set" : "Property Set") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    if (apply(_target)) {
                        _target.newPropertySet();
                    }
                }
            };

        _array[TreeNode.NEW_REPLICA_GROUP] =
            new AbstractAction(popup ? "New Replica Group" : "Replica Group") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    if (apply(_target)) {
                        _target.newReplicaGroup();
                    }
                }
            };

        _array[TreeNode.NEW_SERVER] =
            new AbstractAction(popup ? "New Server" : "Server") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    if (apply(_target)) {
                        _target.newServer();
                    }
                }
            };

        _array[TreeNode.NEW_SERVER_ICEBOX] =
            new AbstractAction(popup ? "New IceBox Server" : "IceBox Server") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    if (apply(_target)) {
                        _target.newServerIceBox();
                    }
                }
            };

        _array[TreeNode.NEW_SERVER_FROM_TEMPLATE] =
            new AbstractAction(popup ? "New Server from Template" : "Server from Template") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    if (apply(_target)) {
                        _target.newServerFromTemplate();
                    }
                }
            };

        _array[TreeNode.NEW_SERVICE] =
            new AbstractAction(popup ? "New Service" : "Service") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    if (apply(_target)) {
                        _target.newService();
                    }
                }
            };

        _array[TreeNode.NEW_SERVICE_FROM_TEMPLATE] =
            new AbstractAction(popup ? "New Service from Template" : "Service from Template") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    if (apply(_target)) {
                        _target.newServiceFromTemplate();
                    }
                }
            };

        _array[TreeNode.NEW_TEMPLATE_SERVER] =
            new AbstractAction(popup ? "New Server Template" : "Server Template") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    if (apply(_target)) {
                        _target.newTemplateServer();
                    }
                }
            };

        _array[TreeNode.NEW_TEMPLATE_SERVER_ICEBOX] =
            new AbstractAction(
                popup ? "New IceBox Server Template" : "IceBox Server Template") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    if (apply(_target)) {
                        _target.newTemplateServerIceBox();
                    }
                }
            };

        _array[TreeNode.NEW_TEMPLATE_SERVICE] =
            new AbstractAction(popup ? "New Service Template" : "Service Template") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    if (apply(_target)) {
                        _target.newTemplateService();
                    }
                }
            };

        _array[TreeNode.COPY] =
            new AbstractAction("Copy") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    _target.copy();
                }
            };

        _array[TreeNode.PASTE] =
            new AbstractAction("Paste") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    if (apply(_target)) {
                        _target.paste();
                    }
                }
            };

        _array[TreeNode.DELETE] =
            new AbstractAction("Delete") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    _target.delete();
                }
            };

        _array[TreeNode.SHOW_VARS] =
            new AbstractAction("Show Variables") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    _target.getCoordinator().showVars();
                }
            };

        _array[TreeNode.SHOW_VARS].putValue(
            Action.SHORT_DESCRIPTION, "Show variables and parameters in the Properties pane");

        _array[TreeNode.SUBSTITUTE_VARS] =
            new AbstractAction("Substitute Variables") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    _target.getCoordinator().substituteVars();
                }
            };

        _array[TreeNode.SUBSTITUTE_VARS].putValue(
            Action.SHORT_DESCRIPTION,
            "Substitute variables and parameters with their values in the Properties pane");

        _array[TreeNode.MOVE_UP] =
            new AbstractAction("Move Up") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    if (apply(_target)) {
                        _target.moveUp();
                    }
                }
            };

        _array[TreeNode.MOVE_DOWN] =
            new AbstractAction("Move Down") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    if (apply(_target)) {
                        _target.moveDown();
                    }
                }
            };
    }

    private static boolean apply(TreeNode target) {
        return target.getRoot().getPane().applyUpdates(false);
    }

    private TreeNode _target;
    private final Action[] _array = new Action[TreeNode.ACTION_COUNT];
}
