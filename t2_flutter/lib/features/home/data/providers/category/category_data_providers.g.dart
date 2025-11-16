// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryDaoHash() => r'12ec13ec2a0334db5a2e6ada2eeccb88d40f9762';

/// See also [categoryDao].
@ProviderFor(categoryDao)
final categoryDaoProvider = AutoDisposeProvider<CategoryDao>.internal(
  categoryDao,
  name: r'categoryDaoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$categoryDaoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CategoryDaoRef = AutoDisposeProviderRef<CategoryDao>;
String _$categoryLocalDataSourceHash() =>
    r'03e5408e95291c441ab3640dd2617c45c2c0d4e2';

/// See also [categoryLocalDataSource].
@ProviderFor(categoryLocalDataSource)
final categoryLocalDataSourceProvider =
    AutoDisposeProvider<ICategoryLocalDataSource>.internal(
      categoryLocalDataSource,
      name: r'categoryLocalDataSourceProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$categoryLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CategoryLocalDataSourceRef =
    AutoDisposeProviderRef<ICategoryLocalDataSource>;
String _$categoryRemoteDataSourceHash() =>
    r'6bee0ea838bfd7c946e03f75b5137cafdbf79fea';

/// See also [categoryRemoteDataSource].
@ProviderFor(categoryRemoteDataSource)
final categoryRemoteDataSourceProvider =
    AutoDisposeProvider<ICategoryRemoteDataSource>.internal(
      categoryRemoteDataSource,
      name: r'categoryRemoteDataSourceProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$categoryRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CategoryRemoteDataSourceRef =
    AutoDisposeProviderRef<ICategoryRemoteDataSource>;
String _$categoryRepositoryHash() =>
    r'2254eaeac6d6519548767df9dea1636558b4702a';

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
/// Copied from [categoryRepository].
@ProviderFor(categoryRepository)
const categoryRepositoryProvider = CategoryRepositoryFamily();

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория
///
/// Copied from [categoryRepository].
class CategoryRepositoryFamily extends Family<ICategoryRepository> {
  /// Семейный провайдер репозитория для конкретного пользователя
  /// Каждый userId получает свой изолированный экземпляр репозитория
  ///
  /// Copied from [categoryRepository].
  const CategoryRepositoryFamily();

  /// Семейный провайдер репозитория для конкретного пользователя
  /// Каждый userId получает свой изолированный экземпляр репозитория
  ///
  /// Copied from [categoryRepository].
  CategoryRepositoryProvider call({
    required int userId,
    required String customerId,
  }) {
    return CategoryRepositoryProvider(userId: userId, customerId: customerId);
  }

  @override
  CategoryRepositoryProvider getProviderOverride(
    covariant CategoryRepositoryProvider provider,
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
  String? get name => r'categoryRepositoryProvider';
}

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория
///
/// Copied from [categoryRepository].
class CategoryRepositoryProvider
    extends AutoDisposeProvider<ICategoryRepository> {
  /// Семейный провайдер репозитория для конкретного пользователя
  /// Каждый userId получает свой изолированный экземпляр репозитория
  ///
  /// Copied from [categoryRepository].
  CategoryRepositoryProvider({required int userId, required String customerId})
    : this._internal(
        (ref) => categoryRepository(
          ref as CategoryRepositoryRef,
          userId: userId,
          customerId: customerId,
        ),
        from: categoryRepositoryProvider,
        name: r'categoryRepositoryProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$categoryRepositoryHash,
        dependencies: CategoryRepositoryFamily._dependencies,
        allTransitiveDependencies:
            CategoryRepositoryFamily._allTransitiveDependencies,
        userId: userId,
        customerId: customerId,
      );

  CategoryRepositoryProvider._internal(
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
    ICategoryRepository Function(CategoryRepositoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategoryRepositoryProvider._internal(
        (ref) => create(ref as CategoryRepositoryRef),
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
  AutoDisposeProviderElement<ICategoryRepository> createElement() {
    return _CategoryRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryRepositoryProvider &&
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
mixin CategoryRepositoryRef on AutoDisposeProviderRef<ICategoryRepository> {
  /// The parameter `userId` of this provider.
  int get userId;

  /// The parameter `customerId` of this provider.
  String get customerId;
}

class _CategoryRepositoryProviderElement
    extends AutoDisposeProviderElement<ICategoryRepository>
    with CategoryRepositoryRef {
  _CategoryRepositoryProviderElement(super.provider);

  @override
  int get userId => (origin as CategoryRepositoryProvider).userId;
  @override
  String get customerId => (origin as CategoryRepositoryProvider).customerId;
}

String _$currentUserCategoryRepositoryHash() =>
    r'43e93e71a04b15d0654cec98437fc33215a02905';

/// Удобный провайдер для получения репозитория текущего пользователя
/// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий
///
/// Copied from [currentUserCategoryRepository].
@ProviderFor(currentUserCategoryRepository)
final currentUserCategoryRepositoryProvider =
    AutoDisposeProvider<ICategoryRepository?>.internal(
      currentUserCategoryRepository,
      name: r'currentUserCategoryRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$currentUserCategoryRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentUserCategoryRepositoryRef =
    AutoDisposeProviderRef<ICategoryRepository?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
