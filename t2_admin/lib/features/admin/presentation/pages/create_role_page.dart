// lib/features/admin/presentation/pages/create_role_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:t2_client/t2_client.dart';

import '../providers/roles_providers.dart';
import '../providers/users_providers.dart';

class CreateRolePage extends ConsumerStatefulWidget {
  const CreateRolePage({super.key});

  @override
  ConsumerState<CreateRolePage> createState() => _CreateRolePageState();
}

class _CreateRolePageState extends ConsumerState<CreateRolePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  
  String? _selectedCustomerId;
  final Set<String> _selectedPermissions = <String>{};
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _createRole() async {
    if (!_formKey.currentState!.validate() || 
        _selectedCustomerId == null ||
        _selectedPermissions.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Заполните все поля и выберите разрешения')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      await ref.read(createRoleProvider(
        roleName: _nameController.text,
        roleDescription: _descriptionController.text.isEmpty 
            ? null 
            : _descriptionController.text,
        permissionIds: _selectedPermissions.toList(),
        customerId: _selectedCustomerId!,
      ).future);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Роль успешно создана'),
            backgroundColor: Colors.green,
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка при создании роли: $e'),
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
    final permissionsState = ref.watch(permissionsListProvider);
    final customersState = ref.watch(customersListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить роль'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.security,
                size: 64,
                color: Colors.green,
              ),
              const SizedBox(height: 24),
              
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Название роли',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.badge),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Введите название роли';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Описание (необязательно)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description),
                ),
                maxLines: 3,
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
              
              const Text(
                'Разрешения:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              
              Expanded(
                child: permissionsState.when(
                  data: (permissions) {
                    return ListView.builder(
                      itemCount: permissions.length,
                      itemBuilder: (context, index) {
                        final permission = permissions[index];
                        final isSelected = _selectedPermissions.contains(permission.id.toString());
                        
                        return CheckboxListTile(
                          title: Text(permission.key ?? 'Без названия'),
                          subtitle: permission.description != null 
                              ? Text(permission.description!)
                              : null,
                          value: isSelected,
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                _selectedPermissions.add(permission.id.toString());
                              } else {
                                _selectedPermissions.remove(permission.id.toString());
                              }
                            });
                          },
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Center(
                    child: Text('Ошибка загрузки разрешений: $error'),
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              ElevatedButton(
                onPressed: _isLoading ? null : _createRole,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
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
                    : const Text('Создать роль'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}