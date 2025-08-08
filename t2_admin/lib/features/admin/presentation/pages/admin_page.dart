// lib/features/admin/presentation/pages/admin_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/presentation/providers/auth_state_providers.dart';
import '../routings/user_routes_constants.dart';
import '../routings/roles_routes_constants.dart';
import '../routings/organizations_routes_constants.dart';

class AdminPage extends ConsumerWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const _AdminHeader(),
            const SizedBox(height: 32),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: _AdminFunctionsGrid(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdminHeader extends ConsumerWidget {
  const _AdminHeader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(authStateChangesProvider);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue, Colors.purple],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Добро пожаловать, ${userState.value?.userName ?? 'Администратор'}!',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Панель управления T2 системой',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
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
            context.push(UsersRoutes.usersPath);
          },
        ),
        _AdminFunctionCard(
          title: 'Управление ролями',
          description: 'Создание и настройка ролей и разрешений',
          icon: Icons.security,
          color: Colors.green,
          onTap: () {
            context.push(RolesRoutes.rolesPath);
          },
        ),
        _AdminFunctionCard(
          title: 'Организации',
          description: 'Управление организациями системы',
          icon: Icons.business,
          color: Colors.orange,
          onTap: () {
            context.push(OrganizationsRoutes.organizationsPath);
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
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: color,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}