// lib/features/admin/presentation/pages/admin_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/dashboard/dashboard_widgets.dart'; // <-- Наш новый импорт

class AdminPage extends ConsumerWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Панель управления'),
        actions: [
          // Можно добавить, например, кнопку выхода
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // TODO: Реализовать выход
            },
          )
        ],
      ),
      body: const DashboardView(), // <-- Просто отображаем наш новый дашборд
    );
  }
}

// Удаляем старые виджеты _AdminHeader и _AdminFunctionsGrid, они больше не нужны.