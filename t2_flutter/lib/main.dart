// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Импорты из нового пакета app_core
import 'package:app_core/app_core.dart';

// Импорты из нашего приложения с префиксом
import 'package:t2/core/dependencies/configuration_dependencies_impl.dart';
import 'package:t2/core/providers/session_manager_provider.dart' as session_providers;
import 'package:t2/features/configuration/domain/providers/configuration/configuration_dependencies_provider.dart';
import 'package:t2/features/configuration/presentation/user_settings/groups/groups_list.dart';
import 'package:t2/features/settings_definitions/app_groups_list.dart';

import './app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final container = ProviderContainer();
  final appGroups = container.read(appSettingGroupsProvider);
  container.dispose();

  runApp(
    ProviderScope(
      overrides: [
        // --- Переопределения для провайдеров из APP_CORE ---

        // 1. Переопределяем абстрактный userInfoStreamProvider
        userInfoStreamProvider.overrideWith(
          // и передаем в него функцию-реализацию из нашего файла через префикс.
          // Это более современный способ, который решает проблему с .stream
          (ref) => session_providers.serverpodUserInfoStream(ref),
        ),

        // 2. То же самое для customerId
        currentCustomerIdProvider.overrideWith(
          (ref) => ref.watch(session_providers.serverpodCurrentCustomerIdProvider),
        ),
        
        // --- Остальные переопределения ---
        configurationDependenciesProvider.overrideWith(
          (ref) => ConfigurationDependenciesImpl(ref),
        ),
        settingGroupsProvider.overrideWithValue(appGroups),
      ],
      child: const App(),
    ),
  );
}