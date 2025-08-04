// lib/features/configuration/presentation/pages/configuration_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/configuration/configuration_state_providers.dart';

class ConfigurationPage extends ConsumerWidget {
  const ConfigurationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Используем StreamProvider для получения всех конфигураций в реальном времени
    final configurationsAsync = ref.watch(configurationsStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: configurationsAsync.when(
        data: (configurations) {
          if (configurations.isEmpty) {
            return const Center(child: Text('Настройки не найдены.'));
          }

          return ListView.builder(
            itemCount: configurations.length,
            itemBuilder: (context, index) {
              final config = configurations[index];
              return ListTile(
                title: Text(config.key),
                subtitle: Text('Значение: ${config.value}'),
                // Здесь можно добавить логику для редактирования
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    // TODO: Реализовать логику редактирования
                    print('Редактировать настройку: ${config.key}');
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Ошибка загрузки настроек: $e')),
      ),
    );
  }
}