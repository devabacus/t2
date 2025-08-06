// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$configurationServiceHash() =>
    r'addbe4bab3216f38e62835d0fe820273c28b4b62';

/// Провайдер, предоставляющий экземпляр сервиса конфигурации [IConfigurationService].
///
/// Он следит за текущим пользователем и автоматически предоставляет сервис,
/// настроенный для этого пользователя. Выбрасывает исключение, если
/// пользователь не аутентифицирован, так как работа с настройками без
/// пользователя не имеет смысла.
///
/// Copied from [configurationService].
@ProviderFor(configurationService)
final configurationServiceProvider =
    AutoDisposeProvider<IConfigurationService>.internal(
      configurationService,
      name: r'configurationServiceProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$configurationServiceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConfigurationServiceRef = AutoDisposeProviderRef<IConfigurationService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
