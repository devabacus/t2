// lib/features/admin/presentation/pages/users/users_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/users_providers.dart';
import '../routings/user_routes_constants.dart';

class UsersPage extends ConsumerWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(usersListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Управление пользователями'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            tooltip: 'Добавить пользователя',
            onPressed: () {
              context.push(UsersRoutes.createUserPath);
            },
          ),
        ],
      ),
      body: usersState.when(
        data: (users) {
          if (users.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.people_outline,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Пользователи не найдены',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Добавьте первого пользователя',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final userDetails = users[index];
              final user = userDetails.userInfo;
              final role = userDetails.role;

              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: user.blocked ? Colors.red : Colors.blue,
                    child: Text(
                      user.userName!.isNotEmpty 
                          ? user.userName![0].toUpperCase()
                          : 'У',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(user.userName!),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.email!),
                      if (role != null)
                        Text(
                          'Роль: ${role.name}',
                          style: TextStyle(
                            color: Colors.blue.shade700,
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),
                  trailing: user.blocked
                      ? const Icon(Icons.block, color: Colors.red)
                      : const Icon(Icons.check_circle, color: Colors.green),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Ошибка загрузки: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.refresh(usersListProvider),
                child: const Text('Повторить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}