// lib/features/admin/presentation/pages/admin_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Добавляем импорт для доступа к нашему use case
import '../../../auth/domain/providers/auth_usecase_providers.dart';
import '../widgets/dashboard/dashboard_widgets.dart';

class AdminPage extends ConsumerWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Панель управления'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Выход',
            // 2. Реализуем логику выхода
            onPressed: () async {
              // Вызываем use case для выхода
              await ref.read(signOutUseCaseProvider)();
              // GoRouter и AuthWrapperPage автоматически обработают
              // перенаправление на страницу входа
            },
          )
        ],
      ),
      body: const DashboardView(),
    );
  }
}