// Copyright (c) ZeroC, Inc.

package com.zeroc.IceGridGUI.Application;

import com.zeroc.IceGridGUI.Utils;

import java.awt.event.ActionEvent;
import java.util.Map;
import java.util.TreeMap;
import java.util.Vector;

import javax.swing.AbstractAction;
import javax.swing.Action;
import javax.swing.JTable;
import javax.swing.KeyStroke;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;

/** A special field used to show/edit a map */
public class ArrayMapField extends JTable {
    public ArrayMapField(Editor editor, boolean substituteKey, String... columns) {
        _editor = editor;
        _substituteKey = substituteKey;
        _vectorSize = columns.length;

        _columnNames = new Vector<>(_vectorSize);
        for (String name : columns) {
            _columnNames.add(name);
        }

        assert _vectorSize > 2;

        // Adjust row height for larger fonts
        int fontSize = getFont().getSize();
        int minRowHeight = fontSize + fontSize / 3;
        if (rowHeight < minRowHeight) {
            setRowHeight(minRowHeight);
        }

        Action deleteRow =
            new AbstractAction("Delete selected row(s)") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    if (_editable) {
                        if (isEditing()) {
                            getCellEditor().stopCellEditing();
                        }

                        for (; ; ) {
                            int selectedRow = getSelectedRow();
                            if (selectedRow == -1) {
                                break;
                            } else {
                                _model.removeRow(selectedRow);
                            }
                        }
                    }
                }
            };
        getActionMap().put("delete", deleteRow);
        getInputMap().put(KeyStroke.getKeyStroke("DELETE"), "delete");
    }

    public void set(
            Map<String, String[]> map, Utils.Resolver resolver, boolean editable) {
        _editable = editable;
        assert (_vectorSize > 2);

        // Transform map into vector of vectors
        Vector<Vector<String>> vector = new Vector<>(map.size());
        for (Map.Entry<String, String[]> p : map.entrySet()) {
            Vector<String> row = new Vector<>(_vectorSize);

            if (_substituteKey) {
                row.add(Utils.substitute(p.getKey(), resolver));
            } else {
                row.add(p.getKey());
            }

            for (String val : p.getValue()) {
                row.add(Utils.substitute(val, resolver));
            }

            vector.add(row);
        }

        if (_editable) {
            Vector<String> newRow = new Vector<>(_vectorSize);
            for (int i = 0; i < _vectorSize; i++) {
                newRow.add("");
            }
            vector.add(newRow);
        }

        _model =
            new DefaultTableModel(vector, _columnNames) {
                @Override
                public boolean isCellEditable(int row, int column) {
                    return _editable;
                }
            };

        _model.addTableModelListener(
            new TableModelListener() {
                @Override
                public void tableChanged(TableModelEvent e) {
                    if (_editable) {
                        Object lastKey = _model.getValueAt(_model.getRowCount() - 1, 0);
                        if (lastKey != null && !"".equals(lastKey)) {
                            Object[] emptyRow = new Object[_vectorSize];
                            for (int i = 0; i < _vectorSize; i++) {
                                emptyRow[i] = "";
                            }
                            _model.addRow(emptyRow);
                        }
                        _editor.updated();
                    }
                }
            });
        setModel(_model);

        setCellSelectionEnabled(_editable);
        setOpaque(_editable);
        setPreferredScrollableViewportSize(getPreferredSize());

        DefaultTableCellRenderer cr = (DefaultTableCellRenderer) getDefaultRenderer(String.class);
        cr.setOpaque(_editable);
    }

    public TreeMap<String, String[]> get() {
        assert _editable;
        assert (_vectorSize > 2);

        if (isEditing()) {
            getCellEditor().stopCellEditing();
        }
        @SuppressWarnings("unchecked")
        Vector<Vector> vector = _model.getDataVector();

        TreeMap<String, String[]> result = new TreeMap<>();

        for (Vector row : vector) {
            // Eliminate rows with null or empty keys
            String key = row.elementAt(0).toString();
            if (key != null) {
                key = key.trim();
                if (!key.isEmpty()) {
                    String[] val = new String[_vectorSize - 1];
                    for (int i = 1; i < _vectorSize; i++) {
                        val[i - 1] = row.elementAt(i).toString();
                        if (val[i - 1] == null) {
                            val[i - 1] = "";
                        }
                    }
                    result.put(key, val);
                }
            }
        }
        return result;
    }

    private final int _vectorSize;

    private DefaultTableModel _model;
    private final Vector<String> _columnNames;
    private boolean _editable;

    private final boolean _substituteKey;

    private final Editor _editor;
}
