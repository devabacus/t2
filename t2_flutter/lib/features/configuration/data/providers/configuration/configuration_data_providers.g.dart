// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$configurationDaoHash() => r'62536fc24f8539d26616fefc8b28b642f7d533a8';

/// See also [configurationDao].
@ProviderFor(configurationDao)
final configurationDaoProvider = AutoDisposeProvider<ConfigurationDao>.internal(
  configurationDao,
  name: r'configurationDaoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$configurationDaoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConfigurationDaoRef = AutoDisposeProviderRef<ConfigurationDao>;
String _$configurationRemoteDataSourceHash() =>
    r'9818702f9ddf670e5ab81c0b27dc36a092c2f9ef';

/// See also [configurationRemoteDataSource].
@ProviderFor(configurationRemoteDataSource)
final configurationRemoteDataSourceProvider =
    AutoDisposeProvider<IConfigurationRemoteDataSource>.internal(
      configurationRemoteDataSource,
      name: r'configurationRemoteDataSourceProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$configurationRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConfigurationRemoteDataSourceRef =
    AutoDisposeProviderRef<IConfigurationRemoteDataSource>;
String _$configurationLocalDataSourceHash() =>
    r'237a77839e4005e91f20f898235e6f1a68bd10d1';

/// See also [configurationLocalDataSource].
@ProviderFor(configurationLocalDataSource)
final configurationLocalDataSourceProvider =
    AutoDisposeProvider<IConfigurationLocalDataSource>.internal(
      configurationLocalDataSource,
      name: r'configurationLocalDataSourceProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$configurationLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConfigurationLocalDataSourceRef =
    AutoDisposeProviderRef<IConfigurationLocalDataSource>;
String _$configurationRepositoryHash() =>
    r'86639af28426f8b9393a83d28a89086eb79e17c4';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория
///
/// Copied from [configurationRepository].
@ProviderFor(configurationRepository)
const configurationRepositoryProvider = ConfigurationRepositoryFamily();

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория
///
/// Copied from [configurationRepository].
class ConfigurationRepositoryFamily extends Family<IConfigurationRepository> {
  /// Семейный провайдер репозитория для конкретного пользователя
  /// Каждый userId получает свой изолированный экземпляр репозитория
  ///
  /// Copied from [configurationRepository].
  const ConfigurationRepositoryFamily();

  /// Семейный провайдер репозитория для конкретного пользователя
  /// Каждый userId получает свой изолированный экземпляр репозитория
  ///
  /// Copied from [configurationRepository].
  ConfigurationRepositoryProvider call({
    required int userId,
    required String customerId,
  }) {
    return ConfigurationRepositoryProvider(
      userId: userId,
      customerId: customerId,
    );
  }

  @override
  ConfigurationRepositoryProvider getProviderOverride(
    covariant ConfigurationRepositoryProvider provider,
  ) {
    return call(userId: provider.userId, customerId: provider.customerId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'configurationRepositoryProvider';
}

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория
///
/// Copied from [configurationRepository].
class ConfigurationRepositoryProvider
    extends AutoDisposeProvider<IConfigurationRepository> {
  /// Семейный провайдер репозитория для конкретного пользователя
  /// Каждый userId получает свой изолированный экземпляр репозитория
  ///
  /// Copied from [configurationRepository].
  ConfigurationRepositoryProvider({
    required int userId,
    required String customerId,
  }) : this._internal(
         (ref) => configurationRepository(
           ref as ConfigurationRepositoryRef,
           userId: userId,
           customerId: customerId,
         ),
         from: configurationRepositoryProvider,
         name: r'configurationRepositoryProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$configurationRepositoryHash,
         dependencies: ConfigurationRepositoryFamily._dependencies,
         allTransitiveDependencies:
             ConfigurationRepositoryFamily._allTransitiveDependencies,
         userId: userId,
         customerId: customerId,
       );

  ConfigurationRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
    required this.customerId,
  }) : super.internal();

  final int userId;
  final String customerId;

  @override
  Override overrideWith(
    IConfigurationRepository Function(ConfigurationRepositoryRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConfigurationRepositoryProvider._internal(
        (ref) => create(ref as ConfigurationRepositoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
        customerId: customerId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<IConfigurationRepository> createElement() {
    return _ConfigurationRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConfigurationRepositoryProvider &&
        other.userId == userId &&
        other.customerId == customerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ConfigurationRepositoryRef
    on AutoDisposeProviderRef<IConfigurationRepository> {
  /// The parameter `userId` of this provider.
  int get userId;

  /// The parameter `customerId` of this provider.
  String get customerId;
}

class _ConfigurationRepositoryProviderElement
    extends AutoDisposeProviderElement<IConfigurationRepository>
    with ConfigurationRepositoryRef {
  _ConfigurationRepositoryProviderElement(super.provider);

  @override
  int get userId => (origin as ConfigurationRepositoryProvider).userId;
  @override
  String get customerId =>
      (origin as ConfigurationRepositoryProvider).customerId;
}

String _$currentUserConfigurationRepositoryHash() =>
    r'c05c8c8331647b5bf8d89793cab442078b19eb22';

/// Удобный провайдер для получения репозитория текущего пользователя
/// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий
///
/// Copied from [currentUserConfigurationRepository].
@ProviderFor(currentUserConfigurationRepository)
final currentUserConfigurationRepositoryProvider =
    AutoDisposeProvider<IConfigurationRepository?>.internal(
      currentUserConfigurationRepository,
      name: r'currentUserConfigurationRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$currentUserConfigurationRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentUserConfigurationRepositoryRef =
    AutoDisposeProviderRef<IConfigurationRepository?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
