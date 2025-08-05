// manifest: startProject
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/configuration/configuration_entity.dart';
import '../models/setting_view_model.dart';

part 'settings_mapper.g.dart';

/// Ключи настроек для избежания "магических строк".
enum SettingKey {
  themeMode('themeMode', 'UI'),
  themeOptions('themeOptions', 'UI'),
  enableAnimations('enableAnimations', 'UI'),
  username('username', 'Profile');

  const SettingKey(this.key, this.group);
  final String key;
  final String group;
}


class SettingsMapper {

  /// Валидирует и преобразует список ConfigurationEntity в список SettingViewModel.
  List<SettingViewModel> map(List<ConfigurationEntity> configs) {
    final configMap = {for (var c in configs) c.key: c};
    final viewModels = <SettingViewModel>[];

    // Обрабатываем каждую известную настройку
    for (final settingKey in SettingKey.values) {
      final config = configMap[settingKey.key];
      if (config != null) {
        final vm = _mapSingle(config, configMap);
        if (vm != null) {
          viewModels.add(vm);
        }
      }
    }
    
    return viewModels;
  }

  /// Преобразует одну сущность в ViewModel.
  SettingViewModel? _mapSingle(ConfigurationEntity config, Map<String, ConfigurationEntity> allConfigs) {
    // Используем switch по ключу для определения логики маппинга
    switch (config.key) {
      case 'themeMode':
        final optionsConfig = allConfigs[SettingKey.themeOptions.key];
        return OptionsSettingViewModel(
          key: config.key,
          displayName: 'Тема приложения',
          group: config.group,
          currentValue: config.value,
          options: optionsConfig?.value.split(';') ?? ['system', 'light', 'dark'],
        );
      
      case 'enableAnimations':
        if (config.value != 'true' && config.value != 'false') {
          return null; // Невалидное значение
        }
        return BooleanSettingViewModel(
          key: config.key,
          displayName: 'Включить анимации',
          group: config.group,
          value: config.value == 'true',
        );

      case 'username':
        return StringSettingViewModel(
          key: config.key,
          displayName: 'Имя пользователя',
          group: config.group,
          value: config.value,
        );

      // 'themeOptions' - это служебная настройка, не отображаем ее
      case 'themeOptions':
        return null; 
        
      default:
        return UnsupportedSettingViewModel(
          key: config.key, 
          displayName: 'Неизвестная настройка',
          group: config.group
        );
    }
  }
}

@riverpod
SettingsMapper settingsMapper(Ref ref) {
  return SettingsMapper();
}