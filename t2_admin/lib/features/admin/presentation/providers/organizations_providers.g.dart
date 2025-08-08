// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizations_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$organizationsListHash() => r'21d5c75a3ed52366cdaeee24de2d95109caaf5b0';

/// See also [organizationsList].
@ProviderFor(organizationsList)
final organizationsListProvider =
    AutoDisposeFutureProvider<List<Customer>>.internal(
      organizationsList,
      name: r'organizationsListProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$organizationsListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OrganizationsListRef = AutoDisposeFutureProviderRef<List<Customer>>;
String _$createOrganizationHash() =>
    r'b0853d97b17f427224ba941497c4e3445f38b86d';

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

/// See also [createOrganization].
@ProviderFor(createOrganization)
const createOrganizationProvider = CreateOrganizationFamily();

/// See also [createOrganization].
class CreateOrganizationFamily extends Family<AsyncValue<void>> {
  /// See also [createOrganization].
  const CreateOrganizationFamily();

  /// See also [createOrganization].
  CreateOrganizationProvider call({
    required String organizationName,
    required String? organizationEmail,
    required String? organizationInfo,
  }) {
    return CreateOrganizationProvider(
      organizationName: organizationName,
      organizationEmail: organizationEmail,
      organizationInfo: organizationInfo,
    );
  }

  @override
  CreateOrganizationProvider getProviderOverride(
    covariant CreateOrganizationProvider provider,
  ) {
    return call(
      organizationName: provider.organizationName,
      organizationEmail: provider.organizationEmail,
      organizationInfo: provider.organizationInfo,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'createOrganizationProvider';
}

/// See also [createOrganization].
class CreateOrganizationProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createOrganization].
  CreateOrganizationProvider({
    required String organizationName,
    required String? organizationEmail,
    required String? organizationInfo,
  }) : this._internal(
         (ref) => createOrganization(
           ref as CreateOrganizationRef,
           organizationName: organizationName,
           organizationEmail: organizationEmail,
           organizationInfo: organizationInfo,
         ),
         from: createOrganizationProvider,
         name: r'createOrganizationProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$createOrganizationHash,
         dependencies: CreateOrganizationFamily._dependencies,
         allTransitiveDependencies:
             CreateOrganizationFamily._allTransitiveDependencies,
         organizationName: organizationName,
         organizationEmail: organizationEmail,
         organizationInfo: organizationInfo,
       );

  CreateOrganizationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.organizationName,
    required this.organizationEmail,
    required this.organizationInfo,
  }) : super.internal();

  final String organizationName;
  final String? organizationEmail;
  final String? organizationInfo;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateOrganizationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateOrganizationProvider._internal(
        (ref) => create(ref as CreateOrganizationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        organizationName: organizationName,
        organizationEmail: organizationEmail,
        organizationInfo: organizationInfo,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateOrganizationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateOrganizationProvider &&
        other.organizationName == organizationName &&
        other.organizationEmail == organizationEmail &&
        other.organizationInfo == organizationInfo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, organizationName.hashCode);
    hash = _SystemHash.combine(hash, organizationEmail.hashCode);
    hash = _SystemHash.combine(hash, organizationInfo.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateOrganizationRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `organizationName` of this provider.
  String get organizationName;

  /// The parameter `organizationEmail` of this provider.
  String? get organizationEmail;

  /// The parameter `organizationInfo` of this provider.
  String? get organizationInfo;
}

class _CreateOrganizationProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with CreateOrganizationRef {
  _CreateOrganizationProviderElement(super.provider);

  @override
  String get organizationName =>
      (origin as CreateOrganizationProvider).organizationName;
  @override
  String? get organizationEmail =>
      (origin as CreateOrganizationProvider).organizationEmail;
  @override
  String? get organizationInfo =>
      (origin as CreateOrganizationProvider).organizationInfo;
}

String _$deleteOrganizationHash() =>
    r'a397b3aba10bda89f3d01e8397852886fd5038a3';

/// See also [deleteOrganization].
@ProviderFor(deleteOrganization)
const deleteOrganizationProvider = DeleteOrganizationFamily();

/// See also [deleteOrganization].
class DeleteOrganizationFamily extends Family<AsyncValue<void>> {
  /// See also [deleteOrganization].
  const DeleteOrganizationFamily();

  /// See also [deleteOrganization].
  DeleteOrganizationProvider call(String organizationId) {
    return DeleteOrganizationProvider(organizationId);
  }

  @override
  DeleteOrganizationProvider getProviderOverride(
    covariant DeleteOrganizationProvider provider,
  ) {
    return call(provider.organizationId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteOrganizationProvider';
}

/// See also [deleteOrganization].
class DeleteOrganizationProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteOrganization].
  DeleteOrganizationProvider(String organizationId)
    : this._internal(
        (ref) =>
            deleteOrganization(ref as DeleteOrganizationRef, organizationId),
        from: deleteOrganizationProvider,
        name: r'deleteOrganizationProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$deleteOrganizationHash,
        dependencies: DeleteOrganizationFamily._dependencies,
        allTransitiveDependencies:
            DeleteOrganizationFamily._allTransitiveDependencies,
        organizationId: organizationId,
      );

  DeleteOrganizationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.organizationId,
  }) : super.internal();

  final String organizationId;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteOrganizationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteOrganizationProvider._internal(
        (ref) => create(ref as DeleteOrganizationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        organizationId: organizationId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteOrganizationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteOrganizationProvider &&
        other.organizationId == organizationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, organizationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteOrganizationRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `organizationId` of this provider.
  String get organizationId;
}

class _DeleteOrganizationProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with DeleteOrganizationRef {
  _DeleteOrganizationProviderElement(super.provider);

  @override
  String get organizationId =>
      (origin as DeleteOrganizationProvider).organizationId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
