// lib/features/admin/presentation/pages/users/edit_user_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:t2_client/t2_client.dart';
import '../providers/roles_providers.dart';
import '../providers/users_providers.dart';

class EditUserPage extends ConsumerStatefulWidget {
  final String userId;
  
  const EditUserPage({
    super.key,
    required this.userId,
  });

  @override
  ConsumerState<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends ConsumerState<EditUserPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  
  String? _selectedCustomerId;
  String? _selectedRoleId;
  bool _isLoading = false;
  bool _isInitialized = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _initializeForm(SuperUserDetails userDetails) {
    if (_isInitialized) return;
    
    _nameController.text = userDetails.userInfo.userName ?? '';
    _emailController.text = userDetails.userInfo.email ?? '';
    _selectedCustomerId = userDetails.customer?.id.toString();
    _selectedRoleId = userDetails.role?.id.toString();
    _isInitialized = true;
  }

  Future<void> _updateUser() async {
    if (!_formKey.currentState!.validate() || 
        _selectedCustomerId == null || 
        _selectedRoleId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Заполните все поля')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      await ref.read(updateUserProvider(
        userId: int.parse(widget.userId),
        userName: _nameController.text,
        email: _emailController.text,
        customerId: _selectedCustomerId!,
        roleId: _selectedRoleId!,
      ).future);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Пользователь успешно обновлен'),
            backgroundColor: Colors.green,
          ),
        );
        context.pop(); // Возвращаемся к списку пользователей
      }
    } catch (e) {
      if (mounted) {
        String errorMessage = 'Ошибка при обновлении пользователя';
        
        if (e.toString().contains('уже существует')) {
          errorMessage = 'Пользователь с таким email уже существует';
        } else if (e.toString().contains('foreign key')) {
          errorMessage = 'Выбранная организация или роль недоступна';
        } else {
          errorMessage = 'Ошибка: ${e.toString()}';
        }
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userDetailsProvider(int.parse(widget.userId)));
    final rolesState = ref.watch(rolesListProvider);
    final customersState = ref.watch(customersListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Редактировать пользователя'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: userState.when(
        data: (userDetails) {
          if (userDetails == null) {
            return const Center(
              child: Text('Пользователь не найден'),
            );
          }

          // Инициализируем форму данными пользователя
          _initializeForm(userDetails);

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.edit,
                    size: 64,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 24),
                  
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Имя пользователя',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Введите имя пользователя';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Введите email';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                        return 'Введите корректный email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  
                  customersState.when(
                    data: (customers) {
                      return DropdownButtonFormField<String>(
                        value: _selectedCustomerId,
                        decoration: const InputDecoration(
                          labelText: 'Организация',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.business),
                        ),
                        items: customers.map((customer) {
                          return DropdownMenuItem<String>(
                            value: customer.id.toString(),
                            child: Text(customer.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedCustomerId = value;
                            _selectedRoleId = null; // Сбрасываем роль при смене организации
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Выберите организацию';
                          }
                          return null;
                        },
                      );
                    },
                    loading: () => const LinearProgressIndicator(),
                    error: (error, stack) => Text('Ошибка загрузки организаций: $error'),
                  ),
                  const SizedBox(height: 16),
                  
                  rolesState.when(
                    data: (roles) {
                      // Фильтруем роли по выбранной организации
                      final filteredRoles = _selectedCustomerId != null
                          ? roles.where((role) => role.customerId.toString() == _selectedCustomerId).toList()
                          : <Role>[];

                      return DropdownButtonFormField<String>(
                        value: _selectedRoleId,
                        decoration: const InputDecoration(
                          labelText: 'Роль',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.security),
                        ),
                        items: filteredRoles.map((role) {
                          return DropdownMenuItem<String>(
                            value: role.id.toString(),
                            child: Text(role.name),
                          );
                        }).toList(),
                        onChanged: filteredRoles.isNotEmpty 
                            ? (value) => setState(() => _selectedRoleId = value)
                            : null,
                        validator: (value) {
                          if (value == null) {
                            return 'Выберите роль';
                          }
                          return null;
                        },
                      );
                    },
                    loading: () => const LinearProgressIndicator(),
                    error: (error, stack) => Text('Ошибка загрузки ролей: $error'),
                  ),
                  const SizedBox(height: 32),
                  
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _isLoading ? null : () => context.pop(),
                          child: const Text('Отмена'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _updateUser,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          child: _isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                )
                              : const Text('Сохранить'),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Информационная карточка о пользователе
                  Card(
                    color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Информация о пользователе',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text('ID: ${userDetails.userInfo.id}'),
                          Text('Создан: ${userDetails.userInfo.created.toLocal().toString().split('.')[0]}'),
                          Text(
                            'Статус: ${userDetails.userInfo.blocked ? 'Заблокирован' : 'Активен'}',
                            style: TextStyle(
                              color: userDetails.userInfo.blocked ? Colors.red : Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Ошибка загрузки пользователя: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.pop(),
                child: const Text('Назад'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}