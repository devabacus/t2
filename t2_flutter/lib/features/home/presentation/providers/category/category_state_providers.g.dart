// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_state_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoriesStreamHash() => r'478d6130884f22933e7ad88921c84f7f5ca555b2';

/// See also [categoriesStream].
@ProviderFor(categoriesStream)
final categoriesStreamProvider =
    AutoDisposeStreamProvider<List<CategoryEntity>>.internal(
      categoriesStream,
      name: r'categoriesStreamProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$categoriesStreamHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CategoriesStreamRef =
    AutoDisposeStreamProviderRef<List<CategoryEntity>>;
String _$categoriesHash() => r'f39a90786254550dcd17b7a204c4846524db7e08';

/// See also [Categories].
@ProviderFor(Categories)
final categoriesProvider =
    AutoDisposeAsyncNotifierProvider<Categories, List<CategoryEntity>>.internal(
      Categories.new,
      name: r'categoriesProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$categoriesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Categories = AutoDisposeAsyncNotifier<List<CategoryEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
