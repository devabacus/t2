// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeModeHash() => r'ae1b2df91122c6b1d5f3b0acf353dcabe72a6245';

/// Следит за изменением темы приложения.
/// Возвращает 'system', 'light' или 'dark'.
///
/// Copied from [themeMode].
@ProviderFor(themeMode)
final themeModeProvider = AutoDisposeStreamProvider<String>.internal(
  themeMode,
  name: r'themeModeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$themeModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ThemeModeRef = AutoDisposeStreamProviderRef<String>;
String _$enableAnimationsHash() => r'efda6df96acefb896c339d68c7e79c92d704ad59';

/// Следит за настройкой анимаций.
///
/// Copied from [enableAnimations].
@ProviderFor(enableAnimations)
final enableAnimationsProvider = AutoDisposeStreamProvider<bool>.internal(
  enableAnimations,
  name: r'enableAnimationsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$enableAnimationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef EnableAnimationsRef = AutoDisposeStreamProviderRef<bool>;
String _$itemsPerPageHash() => r'dbff93a90fbdf5a772889abb5a02c42bf8c5a36d';

/// Следит за настройкой количества элементов на странице.
///
/// Copied from [itemsPerPage].
@ProviderFor(itemsPerPage)
final itemsPerPageProvider = AutoDisposeStreamProvider<int>.internal(
  itemsPerPage,
  name: r'itemsPerPageProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$itemsPerPageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ItemsPerPageRef = AutoDisposeStreamProviderRef<int>;
String _$effectVolumeHash() => r'4f802a0c81c367a089180fe7f207bdd74d187a0b';

/// Следит за настройкой громкости эффектов.
///
/// Copied from [effectVolume].
@ProviderFor(effectVolume)
final effectVolumeProvider = AutoDisposeStreamProvider<double>.internal(
  effectVolume,
  name: r'effectVolumeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$effectVolumeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef EffectVolumeRef = AutoDisposeStreamProviderRef<double>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
