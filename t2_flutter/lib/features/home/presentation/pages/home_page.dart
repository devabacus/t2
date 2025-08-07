// lib/features/home/presentation/pages/home_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:t2/features/configuration/presentation/routing/configuration_routes_constants.dart';
import 'package:t2/features/home/presentation/widgets/creation_section.dart';
import 'package:t2/features/home/presentation/widgets/data_display_section.dart';
import 'package:t2/features/home/presentation/widgets/relation_management_section.dart';
import 'package:t2/features/home/presentation/widgets/settings_display_section.dart';

import '../../../auth/domain/providers/auth_usecase_providers.dart';
import '../../../auth/presentation/providers/auth_state_providers.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String? _selectedCategoryId;
  String? _selectedTaskId;
  String? _selectedTagId;

  @override
  Widget build(BuildContext context) {
      final currentUser = ref.watch(authStateChangesProvider).valueOrNull;


    if (currentUser == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('T2 Demo')),
        body: const Center(child: Text('Пожалуйста, войдите в систему')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('T2 Demo Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Настройки',
            onPressed: () {
              // Используем GoRouter для навигации
              context.push(ConfigurationRoutes.configurationPath);
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Выход',
            onPressed: () async {
              // final sessionManager = ref.read(sessionManagerProvider);
              // await sessionManager.signOutDevice();
              await ref.read(signOutUseCaseProvider)();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Собираем страницу из наших новых виджетов
            const SettingsDisplaySection(),
            const SizedBox(height: 20),
            CreationSection(
              selectedCategoryId: _selectedCategoryId,
              onCategoryChanged: (value) => setState(() => _selectedCategoryId = value),
            ),
            const SizedBox(height: 20),
            RelationManagementSection(
              selectedTaskId: _selectedTaskId,
              selectedTagId: _selectedTagId,
              onTaskChanged: (value) => setState(() => _selectedTaskId = value),
              onTagChanged: (value) => setState(() => _selectedTagId = value),
            ),
            const SizedBox(height: 20),
            DataDisplaySection(
              selectedTaskId: _selectedTaskId,
              selectedTagId: _selectedTagId,
            ),
          ],
        ),
      ),
    );
  }
}