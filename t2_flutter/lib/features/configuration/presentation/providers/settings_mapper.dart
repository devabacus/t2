// manifest: startProject
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t2/features/configuration/domain/entities/configuration/configuration_entity.dart';
import 'package:t2/features/configuration/presentation/registry/settings_registry.dart';
import '../models/setting_view_model.dart';
import '../models/settings_screen_model.dart';

part 'settings_mapper.g.dart';

/// Класс, отвечающий за преобразование "сырых" данных о конфигурации
/// в готовые модели представления (ViewModel) для UI, используя [SettingsRegistry].
class SettingsMapper {
  final SettingsRegistry _registry;

  SettingsMapper(this._registry);

  /// Главный метод-фабрика для создания модели экрана.
  /// Принимает список всех конфигураций и необязательный ключ группы.
  /// Если [groupKey] не указан, создает корневой экран со списком групп.
  /// Если [groupKey] указан, создает экран с настройками для этой группы.
  SettingsScreenModel mapToScreen(List<ConfigurationEntity> configs, {String? groupKey}) {
    if (groupKey == null) {
      return _mapToRootScreen();
    } else {
      return _mapToGroupScreen(configs, groupKey);
    }
  }

  /// Создает модель для корневого экрана настроек (список групп).
  SettingsScreenModel _mapToRootScreen() {
    final allDefinitions = _registry.getAll();
    final groups = allDefinitions.map((def) => def.group).toSet();

    final groupViewModels = groups.map((groupKey) {
      return SettingViewModel.group(
        key: groupKey,
        displayName: _getGroupDisplayName(groupKey),
        group: 'root',
      );
    }).toList();
    
    return SettingsScreenModel(
      title: 'Настройки',
      sections: [
        SettingsSectionModel(title: 'Категории', settings: groupViewModels),
      ],
    );
  }

  /// Создает модель для экрана конкретной группы настроек.
  SettingsScreenModel _mapToGroupScreen(List<ConfigurationEntity> configs, String groupKey) {
    final configMap = {for (var c in configs) c.key: c};
    final definitionsInGroup = _registry.getAll().where((def) => def.group == groupKey);
    
    final viewModels = definitionsInGroup
        .map((definition) {
          final config = configMap[definition.key];
          // Делегируем создание ViewModel самому "чертежу"
          return definition.buildViewModel(config, configMap);
        })
        .whereType<SettingViewModel>() // Отфильтровываем null (служебные настройки)
        .toList();
    
    return SettingsScreenModel(
      title: _getGroupDisplayName(groupKey),
      sections: [
        SettingsSectionModel(title: 'Параметры', settings: viewModels),
      ],
    );
  }
  
  /// Вспомогательный метод для получения человеко-читаемых названий групп.
  String _getGroupDisplayName(String groupKey) {
    // В будущем эту логику можно будет вынести в "чертёж" самой группы
    switch (groupKey) {
      case 'UI':
        return 'Интерфейс';
      case 'Profile':
        return 'Профиль';
      default:
        return groupKey;
    }
  }
}

/// Провайдер Riverpod для доступа к экземпляру SettingsMapper.
/// Он зависит от реестра, поэтому получает его из [settingsRegistryProvider].
@riverpod
SettingsMapper settingsMapper(Ref ref) {
  final registry = ref.watch(settingsRegistryProvider);
  return SettingsMapper(registry);
}