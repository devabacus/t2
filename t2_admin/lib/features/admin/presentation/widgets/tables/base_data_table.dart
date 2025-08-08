// lib/features/admin/presentation/widgets/tables/base_data_table.dart

import 'package:flutter/material.dart';

class BaseDataTable<T> extends StatelessWidget {
  final List<T> items;
  final List<DataColumn> columns;
  final Set<T> selectedItems;
  final bool isSelectAll;
  final VoidCallback onSelectAll;
  final VoidCallback onClearSelection;
  final Function(T) onToggleItem;
  final DataRow Function(T) buildDataRow;
  final bool Function(T) canEdit;
  final bool Function(T) canDelete;
  final Function(T) onEdit;
  final Function(T) onDelete;
  final List<Widget> Function(T) additionalActions;

  const BaseDataTable({
    super.key,
    required this.items,
    required this.columns,
    required this.selectedItems,
    required this.isSelectAll,
    required this.onSelectAll,
    required this.onClearSelection,
    required this.onToggleItem,
    required this.buildDataRow,
    required this.canEdit,
    required this.canDelete,
    required this.onEdit,
    required this.onDelete,
    required this.additionalActions,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          showCheckboxColumn: true,
          columns: [
            DataColumn(
              label: Checkbox(
                value: isSelectAll,
                onChanged: (value) {
                  if (value ?? false) {
                    onSelectAll();
                  } else {
                    onClearSelection();
                  }
                },
              ),
            ),
            ...columns,
            const DataColumn(label: Text('Действия')),
          ],
          rows: items.map((item) {
            final isSelected = selectedItems.contains(item);
            final dataRow = buildDataRow(item);
            
            return DataRow(
              selected: isSelected,
              cells: [
                DataCell(
                  Checkbox(
                    value: isSelected,
                    onChanged: (_) => onToggleItem(item),
                  ),
                ),
                ...dataRow.cells,
                DataCell(
                  _buildActionsCell(item),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildActionsCell(T item) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (canEdit(item))
          IconButton(
            icon: const Icon(Icons.edit, size: 20),
            color: Colors.blue,
            onPressed: () => onEdit(item),
            tooltip: 'Редактировать',
          ),
        if (canDelete(item))
          IconButton(
            icon: const Icon(Icons.delete, size: 20),
            color: Colors.red,
            onPressed: () => onDelete(item),
            tooltip: 'Удалить',
          ),
        ...additionalActions(item),
      ],
    );
  }
}