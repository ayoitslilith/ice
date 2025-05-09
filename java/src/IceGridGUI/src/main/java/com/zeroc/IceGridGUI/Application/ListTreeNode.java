// Copyright (c) ZeroC, Inc.

package com.zeroc.IceGridGUI.Application;

import com.zeroc.IceGridGUI.TreeNodeBase;
import com.zeroc.IceGridGUI.XMLWriter;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.swing.AbstractListModel;
import javax.swing.tree.DefaultTreeModel;

/** An editable TreeNode that holds a list of children */
abstract class ListTreeNode extends TreeNode {
    @Override
    public Enumeration<javax.swing.tree.TreeNode> children() {
        return new Enumeration<javax.swing.tree.TreeNode>() {
            @Override
            public boolean hasMoreElements() {
                return _p.hasNext();
            }

            @Override
            public javax.swing.tree.TreeNode nextElement() {
                return _p.next();
            }

            private Iterator<TreeNodeBase> _p = _children.iterator();
        };
    }

    @Override
    public boolean getAllowsChildren() {
        return true;
    }

    @Override
    public javax.swing.tree.TreeNode getChildAt(int childIndex) {
        if (childIndex < 0) {
            throw new ArrayIndexOutOfBoundsException(childIndex);
        } else if (childIndex < _children.size()) {
            return _children.get(childIndex);
        } else {
            throw new ArrayIndexOutOfBoundsException(childIndex);
        }
    }

    @Override
    public int getChildCount() {
        return _children.size();
    }

    @Override
    public int getIndex(javax.swing.tree.TreeNode node) {
        return _children.indexOf(node);
    }

    @Override
    public boolean isLeaf() {
        return _children.isEmpty();
    }

    @Override
    public Editor getEditor() {
        if (_editor == null) {
            _editor = new Editor();
        }
        return _editor;
    }

    @Override
    protected Editor createEditor() {
        assert false;
        return null;
    }

    protected ListTreeNode(boolean brandNew, TreeNode parent, String id) {
        super(parent, id);
        _editable = new Editable(brandNew);
    }

    @Override
    void write(XMLWriter writer) throws IOException {
        for (TreeNodeBase p : _children) {
            TreeNode node = (TreeNode) p;
            node.write(writer);
        }
    }

    void insertChild(TreeNode child, boolean fireEvent) throws UpdateFailedException {
        DefaultTreeModel treeModel = fireEvent ? getRoot().getTreeModel() : null;

        if (!insertSortedChild(child, _children, treeModel)) {
            throw new UpdateFailedException(this, child.getId());
        }
    }

    void insertChildren(List newChildren, boolean fireEvent)
        throws UpdateFailedException {
        DefaultTreeModel treeModel = fireEvent ? getRoot().getTreeModel() : null;

        String badChildId = insertSortedChildren(newChildren, _children, treeModel);

        if (badChildId != null) {
            throw new UpdateFailedException(this, badChildId);
        }
    }

    int removeChild(TreeNode child) {
        int index = getIndex(child);
        _children.remove(child);

        getRoot().getTreeModel().nodesWereRemoved(this, new int[]{index}, new Object[]{child});
        return index;
    }

    void removeChildren(String[] childIds) {
        removeSortedChildren(childIds, _children, getRoot().getTreeModel());
    }

    void childrenChanged(List children) {
        childrenChanged(children, getRoot().getTreeModel());
    }

    Editable getEditable() {
        return _editable;
    }

    javax.swing.ComboBoxModel createComboBoxModel() {
        return new ComboBoxModel();
    }

    javax.swing.ComboBoxModel createComboBoxModel(Object item) {
        return new ComboBoxModel(item);
    }

    /** Adapts ListTreeNode to a ComboBoxModel */
    class ComboBoxModel extends AbstractListModel implements javax.swing.ComboBoxModel {
        @Override
        public Object getElementAt(int index) {
            if (_firstItem != null) {
                if (index == 0) {
                    return _firstItem;
                } else {
                    return getChildAt(index - 1);
                }
            } else {
                return getChildAt(index);
            }
        }

        @Override
        public int getSize() {
            if (_firstItem != null) {
                return getChildCount() + 1;
            } else {
                return getChildCount();
            }
        }

        @Override
        public Object getSelectedItem() {
            return _selectedItem;
        }

        @Override
        public void setSelectedItem(Object obj) {
            if (obj != _selectedItem) {
                _selectedItem = obj;
                fireContentsChanged(this, -1, -1);
            }
        }

        ComboBoxModel(Object firstItem) {
            _firstItem = firstItem;
        }

        ComboBoxModel() {
            _firstItem = null;
        }

        private final Object _firstItem;
        private Object _selectedItem;
    }

    protected final LinkedList<TreeNodeBase> _children = new LinkedList<>();
    protected Editable _editable;

    private static Editor _editor;
}
