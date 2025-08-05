// manifest: startProject
import 'package:t2/features/configuration/domain/entities/configuration/configuration_entity.dart';
import 'package:t2/features/configuration/presentation/models/setting_view_model.dart';

// Функция-маппер, которая преобразует сырые данные в ViewModel
typedef SettingViewModelMapper = SettingViewModel? Function(
  SettingDefinition definition,
  ConfigurationEntity? config,
  Map<String, ConfigurationEntity> allConfigs,
);

/// Абстрактный базовый класс для всех "чертежей" настроек.
abstract class SettingDefinition {
  final String key;
  final String group;
  final String displayName;
  final String defaultValue;

  SettingDefinition({
    required this.key,
    required this.group,
    required this.displayName,
    required this.defaultValue,
  });

  /// Главный метод, который создает ViewModel.
  /// Логика его реализации будет уникальной для каждого типа настройки.
  SettingViewModel? buildViewModel(
    ConfigurationEntity? config,
    Map<String, ConfigurationEntity> allConfigs,
  );
}

/// "Чертёж" для булевой настройки (переключатель).
class BooleanSettingDefinition extends SettingDefinition {
  BooleanSettingDefinition({
    required super.key,
    required super.group,
    required super.displayName,
    required bool defaultValue, // 1. Принимаем как обычный bool
  }) : super(defaultValue: defaultValue.toString()); // 2. Преобразуем в строку здесь

  @override
  SettingViewModel? buildViewModel(
    ConfigurationEntity? config,
    Map<String, ConfigurationEntity> allConfigs,
  ) {
    final value = config?.value ?? defaultValue;
    return BooleanSettingViewModel(
      key: key,
      displayName: displayName,
      group: group,
      value: value == 'true',
    );
  }
}

/// "Чертёж" для настройки с выбором из списка.
class OptionsSettingDefinition extends SettingDefinition {
  final String optionsKey; // Ключ, по которому хранятся сами опции
  final List<String> defaultOptions;

  OptionsSettingDefinition({
    required super.key,
    required super.group,
    required super.displayName,
    required super.defaultValue,
    required this.optionsKey,
    this.defaultOptions = const [],
  });

  @override
  SettingViewModel? buildViewModel(
    ConfigurationEntity? config,
    Map<String, ConfigurationEntity> allConfigs,
  ) {
    final optionsConfig = allConfigs[optionsKey];
    return OptionsSettingViewModel(
      key: key,
      displayName: displayName,
      group: group,
      currentValue: config?.value ?? defaultValue,
      options: optionsConfig?.value.split(';') ?? defaultOptions,
    );
  }
}

/// "Чертёж" для текстовой настройки.
class StringSettingDefinition extends SettingDefinition {
  StringSettingDefinition({
    required super.key,
    required super.group,
    required super.displayName,
    required super.defaultValue,
  });

  @override
  SettingViewModel? buildViewModel(
    ConfigurationEntity? config,
    Map<String, ConfigurationEntity> allConfigs,
  ) {
    return StringSettingViewModel(
      key: key,
      displayName: displayName,
      group: group,
      value: config?.value ?? defaultValue,
    );
  }
}