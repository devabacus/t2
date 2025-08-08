// lib/features/admin/presentation/pages/admin_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../auth/domain/providers/auth_usecase_providers.dart';
import '../../../auth/presentation/providers/auth_state_providers.dart';

class AdminPage extends ConsumerWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(authStateChangesProvider).valueOrNull;

    return Scaffold(
      appBar: AppBar(
        title: const Text('T2 Admin Panel'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.account_circle),
            onSelected: (value) async {
              if (value == 'logout') {
                await ref.read(signOutUseCaseProvider)();
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'user_info',
                enabled: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentUser?.userName ?? 'Пользователь',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      currentUser?.email ?? '',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, size: 20),
                    SizedBox(width: 8),
                    Text('Выйти'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _WelcomeCard(),
            SizedBox(height: 20),
            Expanded(
              child: _AdminFunctionsGrid(),
            ),
          ],
        ),
      ),
    );
  }
}

class _WelcomeCard extends ConsumerWidget {
  const _WelcomeCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(authStateChangesProvider).valueOrNull;

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            const Icon(
              Icons.admin_panel_settings,
              size: 48,
              color: Colors.deepPurple,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Добро пожаловать, ${currentUser?.userName ?? 'Администратор'}!',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Панель управления T2 системой',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdminFunctionsGrid extends StatelessWidget {
  const _AdminFunctionsGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _AdminFunctionCard(
          title: 'Управление пользователями',
          description: 'Просмотр, создание и редактирование пользователей',
          icon: Icons.people,
          color: Colors.blue,
          onTap: () {
            // TODO: Навигация к странице пользователей
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Функция в разработке')),
            );
          },
        ),
        _AdminFunctionCard(
          title: 'Управление ролями',
          description: 'Создание и настройка ролей и разрешений',
          icon: Icons.security,
          color: Colors.green,
          onTap: () {
            // TODO: Навигация к странице ролей
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Функция в разработке')),
            );
          },
        ),
        _AdminFunctionCard(
          title: 'Организации',
          description: 'Управление организациями системы',
          icon: Icons.business,
          color: Colors.orange,
          onTap: () {
            // TODO: Навигация к странице организаций
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Функция в разработке')),
            );
          },
        ),
        _AdminFunctionCard(
          title: 'Системная информация',
          description: 'Просмотр статуса системы и логов',
          icon: Icons.info,
          color: Colors.purple,
          onTap: () {
            // TODO: Навигация к странице системной информации
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Функция в разработке')),
            );
          },
        ),
      ],
    );
  }
}

class _AdminFunctionCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _AdminFunctionCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: color,
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}