// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizations_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$organizationsListHash() => r'c7d927f0915af2bb7c984f32b7791dcf3f6c23c6';

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
    r'868449ffc9bf307378f7ae070855a60203445b24';

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
    r'b9cf7ecb25c25ccb9cadbb9b31a3c41993746716';

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

String _$organizationDetailsHash() =>
    r'2b8329c6c4805864d06cbaebf3776dfd36eb9704';

/// See also [organizationDetails].
@ProviderFor(organizationDetails)
const organizationDetailsProvider = OrganizationDetailsFamily();

/// See also [organizationDetails].
class OrganizationDetailsFamily extends Family<AsyncValue<Customer?>> {
  /// See also [organizationDetails].
  const OrganizationDetailsFamily();

  /// See also [organizationDetails].
  OrganizationDetailsProvider call(String organizationId) {
    return OrganizationDetailsProvider(organizationId);
  }

  @override
  OrganizationDetailsProvider getProviderOverride(
    covariant OrganizationDetailsProvider provider,
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
  String? get name => r'organizationDetailsProvider';
}

/// See also [organizationDetails].
class OrganizationDetailsProvider extends AutoDisposeFutureProvider<Customer?> {
  /// See also [organizationDetails].
  OrganizationDetailsProvider(String organizationId)
    : this._internal(
        (ref) =>
            organizationDetails(ref as OrganizationDetailsRef, organizationId),
        from: organizationDetailsProvider,
        name: r'organizationDetailsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$organizationDetailsHash,
        dependencies: OrganizationDetailsFamily._dependencies,
        allTransitiveDependencies:
            OrganizationDetailsFamily._allTransitiveDependencies,
        organizationId: organizationId,
      );

  OrganizationDetailsProvider._internal(
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
    FutureOr<Customer?> Function(OrganizationDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OrganizationDetailsProvider._internal(
        (ref) => create(ref as OrganizationDetailsRef),
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
  AutoDisposeFutureProviderElement<Customer?> createElement() {
    return _OrganizationDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OrganizationDetailsProvider &&
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
mixin OrganizationDetailsRef on AutoDisposeFutureProviderRef<Customer?> {
  /// The parameter `organizationId` of this provider.
  String get organizationId;
}

class _OrganizationDetailsProviderElement
    extends AutoDisposeFutureProviderElement<Customer?>
    with OrganizationDetailsRef {
  _OrganizationDetailsProviderElement(super.provider);

  @override
  String get organizationId =>
      (origin as OrganizationDetailsProvider).organizationId;
}

String _$updateOrganizationHash() =>
    r'f0a392fefe6bd2f1e47585ef3832b7259807c0dd';

/// See also [updateOrganization].
@ProviderFor(updateOrganization)
const updateOrganizationProvider = UpdateOrganizationFamily();

/// See also [updateOrganization].
class UpdateOrganizationFamily extends Family<AsyncValue<void>> {
  /// See also [updateOrganization].
  const UpdateOrganizationFamily();

  /// See also [updateOrganization].
  UpdateOrganizationProvider call({required Customer customer}) {
    return UpdateOrganizationProvider(customer: customer);
  }

  @override
  UpdateOrganizationProvider getProviderOverride(
    covariant UpdateOrganizationProvider provider,
  ) {
    return call(customer: provider.customer);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updateOrganizationProvider';
}

/// See also [updateOrganization].
class UpdateOrganizationProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateOrganization].
  UpdateOrganizationProvider({required Customer customer})
    : this._internal(
        (ref) => updateOrganization(
          ref as UpdateOrganizationRef,
          customer: customer,
        ),
        from: updateOrganizationProvider,
        name: r'updateOrganizationProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$updateOrganizationHash,
        dependencies: UpdateOrganizationFamily._dependencies,
        allTransitiveDependencies:
            UpdateOrganizationFamily._allTransitiveDependencies,
        customer: customer,
      );

  UpdateOrganizationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customer,
  }) : super.internal();

  final Customer customer;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateOrganizationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateOrganizationProvider._internal(
        (ref) => create(ref as UpdateOrganizationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customer: customer,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateOrganizationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateOrganizationProvider && other.customer == customer;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customer.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateOrganizationRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `customer` of this provider.
  Customer get customer;
}

class _UpdateOrganizationProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with UpdateOrganizationRef {
  _UpdateOrganizationProviderElement(super.provider);

  @override
  Customer get customer => (origin as UpdateOrganizationProvider).customer;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
