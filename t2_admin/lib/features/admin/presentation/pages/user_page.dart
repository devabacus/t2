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
                      if (role != null) Text('Роль: ${role.name}'),
                      Text(
                        user.blocked ? 'ЗАБЛОКИРОВАН' : 'Активен',
                        style: TextStyle(
                          color: user.blocked ? Colors.red : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Кнопка блокировки/разблокировки
                      IconButton(
                        icon: Icon(
                          user.blocked ? Icons.lock_open : Icons.lock,
                          color: user.blocked ? Colors.green : Colors.orange,
                        ),
                        tooltip: user.blocked ? 'Разблокировать' : 'Заблокировать',
                        onPressed: () => _showBlockUserDialog(
                          context, 
                          ref, 
                          user.id!, 
                          user.userName!, 
                          !user.blocked
                        ),
                      ),
                      // Кнопка редактирования
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        tooltip: 'Редактировать',
                        onPressed: () {
                          context.push('${UsersRoutes.editUserPath}/${user.id}');
                        },
                      ),
                      // Кнопка удаления
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        tooltip: 'Удалить',
                        onPressed: () => _showDeleteUserDialog(
                          context, 
                          ref, 
                          user.id!, 
                          user.userName!
                        ),
                      ),
                    ],
                  ),
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
              Text('Ошибка: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(usersListProvider),
                child: const Text('Повторить'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBlockUserDialog(
    BuildContext context,
    WidgetRef ref,
    int userId,
    String userName,
    bool willBlock,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(willBlock ? 'Заблокировать пользователя' : 'Разблокировать пользователя'),
        content: Text(
          willBlock 
            ? 'Вы уверены, что хотите заблокировать пользователя "$userName"? Он не сможет войти в систему.'
            : 'Вы уверены, что хотите разблокировать пользователя "$userName"?'
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: willBlock ? Colors.orange : Colors.green,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
              
              try {
                await ref.read(blockUserProvider(userId, willBlock).future);
                
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        willBlock 
                          ? 'Пользователь "$userName" заблокирован'
                          : 'Пользователь "$userName" разблокирован'
                      ),
                      backgroundColor: willBlock ? Colors.orange : Colors.green,
                    ),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Ошибка: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            child: Text(willBlock ? 'Заблокировать' : 'Разблокировать'),
          ),
        ],
      ),
    );
  }

  void _showDeleteUserDialog(
    BuildContext context,
    WidgetRef ref,
    int userId,
    String userName,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удалить пользователя'),
        content: Text(
          'Вы уверены, что хотите удалить пользователя "$userName"? '
          'Это действие нельзя отменить!'
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
              
              try {
                await ref.read(deleteUserProvider(userId).future);
                
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Пользователь "$userName" удален'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Ошибка при удалении: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            child: const Text('Удалить'),
          ),
        ],
      ),
    );
  }
}