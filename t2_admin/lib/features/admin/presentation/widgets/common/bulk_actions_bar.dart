// lib/features/admin/presentation/widgets/common/bulk_actions_bar.dart

import 'package:flutter/material.dart';

class BulkActionsBar extends StatelessWidget {
  final int selectedCount;
  final Color themeColor;
  final List<Widget> additionalActions;
  final VoidCallback onDelete;
  final VoidCallback onCancel;

  const BulkActionsBar({
    super.key,
    required this.selectedCount,
    required this.themeColor,
    required this.additionalActions,
    required this.onDelete,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: themeColor.withOpacity(0.1),
      child: Row(
        children: [
          Text(
            'Выбрано: $selectedCount',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: themeColor,
            ),
          ),
          const Spacer(),
          ...additionalActions,
          TextButton.icon(
            onPressed: onDelete,
            icon: const Icon(Icons.delete, color: Colors.red),
            label: const Text(
              'Удалить выбранные',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: onCancel,
            child: const Text('Отменить'),
          ),
        ],
      ),
    );
  }
}