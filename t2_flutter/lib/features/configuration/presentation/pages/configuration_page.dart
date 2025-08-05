// manifest: startProject
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/providers/configuration/configuration_usecase_providers.dart';
import '../providers/configuration/configuration_state_providers.dart';
import '../providers/settings_mapper.dart';
import '../widgets/settings_screen_widget.dart';

/// Страница-контейнер для отображения настроек.
///
/// Эта страница является "умным" компонентом, который:
/// 1. Подписывается на поток данных о конфигурациях.
/// 2. Использует Mapper для преобразования данных в ViewModel.
/// 3. Передает ViewModel в "глупый" UI-компонент [SettingsScreenWidget].
/// 4. Обрабатывает колбэки от UI-компонента для сохранения данных и навигации.
class ConfigurationPage extends ConsumerWidget {
  /// Ключ группы настроек для отображения.
  /// Если null, отображается корневой экран со списком всех групп.
  final String? groupKey;

  const ConfigurationPage({super.key, this.groupKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Подписываемся на общий поток всех конфигураций
    final configurationsAsync = ref.watch(configurationsStreamProvider);
    // Получаем экземпляр маппера
    final mapper = ref.watch(settingsMapperProvider);

    return configurationsAsync.when(
      data: (configs) {
        // 1. Преобразуем сырые данные в декларативную модель экрана,
        // передавая groupKey, чтобы маппер знал, что отображать.
        final screenModel = mapper.mapToScreen(configs, groupKey: groupKey);

        // 2. Определяем колбэк для сохранения измененной настройки.
        onSettingChanged(String key, dynamic value) {
          final useCase = ref.read(updateConfigurationUseCaseProvider);
          // Ищем оригинальную сущность, чтобы обновить ее
          final configToUpdate = configs.firstWhere((c) => c.key == key);
          
          useCase?.call(configToUpdate.copyWith(value: value.toString()));
        }

        // 3. Определяем колбэк для навигации в подгруппу.
        onGroupSelected(String key) {
          Navigator.of(context).push(
            MaterialPageRoute(
              // Открываем новый экземпляр этой же страницы, но уже с ключом группы
              builder: (context) => ConfigurationPage(groupKey: key),
            ),
          );
        }

        // 4. Отображаем универсальный виджет, передавая ему модель и колбэки.
        return SettingsScreenWidget(
          screenModel: screenModel,
          onSettingChanged: onSettingChanged,
          onGroupSelected: onGroupSelected,
        );
      },
      loading: () => Scaffold(
        appBar: AppBar(title: Text(groupKey ?? 'Настройки')),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (e, s) => Scaffold(
        appBar: AppBar(title: const Text('Ошибка')),
        body: Center(child: Text('Ошибка загрузки настроек: $e')),
      ),
    );
  }
}