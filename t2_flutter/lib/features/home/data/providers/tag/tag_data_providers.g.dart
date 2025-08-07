// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tagDaoHash() => r'965263acbade480e4321108eee53e80f0c9ce56c';

/// See also [tagDao].
@ProviderFor(tagDao)
final tagDaoProvider = AutoDisposeProvider<TagDao>.internal(
  tagDao,
  name: r'tagDaoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tagDaoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TagDaoRef = AutoDisposeProviderRef<TagDao>;
String _$tagLocalDataSourceHash() =>
    r'0a6ff7c90cc43f1f99724bf9bef1d17f458a9fee';

/// See also [tagLocalDataSource].
@ProviderFor(tagLocalDataSource)
final tagLocalDataSourceProvider =
    AutoDisposeProvider<ITagLocalDataSource>.internal(
      tagLocalDataSource,
      name: r'tagLocalDataSourceProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$tagLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TagLocalDataSourceRef = AutoDisposeProviderRef<ITagLocalDataSource>;
String _$tagRemoteDataSourceHash() =>
    r'c41c170478a75a0400c9027e355531f6e70263a1';

/// See also [tagRemoteDataSource].
@ProviderFor(tagRemoteDataSource)
final tagRemoteDataSourceProvider =
    AutoDisposeProvider<ITagRemoteDataSource>.internal(
      tagRemoteDataSource,
      name: r'tagRemoteDataSourceProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$tagRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TagRemoteDataSourceRef = AutoDisposeProviderRef<ITagRemoteDataSource>;
String _$tagRepositoryHash() => r'2c6e903ad07787d6ce7a9c8491f3a7853632345a';

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
/// Copied from [tagRepository].
@ProviderFor(tagRepository)
const tagRepositoryProvider = TagRepositoryFamily();

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория
///
/// Copied from [tagRepository].
class TagRepositoryFamily extends Family<ITagRepository> {
  /// Семейный провайдер репозитория для конкретного пользователя
  /// Каждый userId получает свой изолированный экземпляр репозитория
  ///
  /// Copied from [tagRepository].
  const TagRepositoryFamily();

  /// Семейный провайдер репозитория для конкретного пользователя
  /// Каждый userId получает свой изолированный экземпляр репозитория
  ///
  /// Copied from [tagRepository].
  TagRepositoryProvider call({
    required int userId,
    required String customerId,
  }) {
    return TagRepositoryProvider(userId: userId, customerId: customerId);
  }

  @override
  TagRepositoryProvider getProviderOverride(
    covariant TagRepositoryProvider provider,
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
  String? get name => r'tagRepositoryProvider';
}

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория
///
/// Copied from [tagRepository].
class TagRepositoryProvider extends AutoDisposeProvider<ITagRepository> {
  /// Семейный провайдер репозитория для конкретного пользователя
  /// Каждый userId получает свой изолированный экземпляр репозитория
  ///
  /// Copied from [tagRepository].
  TagRepositoryProvider({required int userId, required String customerId})
    : this._internal(
        (ref) => tagRepository(
          ref as TagRepositoryRef,
          userId: userId,
          customerId: customerId,
        ),
        from: tagRepositoryProvider,
        name: r'tagRepositoryProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$tagRepositoryHash,
        dependencies: TagRepositoryFamily._dependencies,
        allTransitiveDependencies:
            TagRepositoryFamily._allTransitiveDependencies,
        userId: userId,
        customerId: customerId,
      );

  TagRepositoryProvider._internal(
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
    ITagRepository Function(TagRepositoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TagRepositoryProvider._internal(
        (ref) => create(ref as TagRepositoryRef),
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
  AutoDisposeProviderElement<ITagRepository> createElement() {
    return _TagRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TagRepositoryProvider &&
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
mixin TagRepositoryRef on AutoDisposeProviderRef<ITagRepository> {
  /// The parameter `userId` of this provider.
  int get userId;

  /// The parameter `customerId` of this provider.
  String get customerId;
}

class _TagRepositoryProviderElement
    extends AutoDisposeProviderElement<ITagRepository>
    with TagRepositoryRef {
  _TagRepositoryProviderElement(super.provider);

  @override
  int get userId => (origin as TagRepositoryProvider).userId;
  @override
  String get customerId => (origin as TagRepositoryProvider).customerId;
}

String _$currentUserTagRepositoryHash() =>
    r'ba976c23935123e6cc5d5ea148a362b856d7c4a2';

/// Удобный провайдер для получения репозитория текущего пользователя
/// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий
///
/// Copied from [currentUserTagRepository].
@ProviderFor(currentUserTagRepository)
final currentUserTagRepositoryProvider =
    AutoDisposeProvider<ITagRepository?>.internal(
      currentUserTagRepository,
      name: r'currentUserTagRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$currentUserTagRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentUserTagRepositoryRef = AutoDisposeProviderRef<ITagRepository?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
