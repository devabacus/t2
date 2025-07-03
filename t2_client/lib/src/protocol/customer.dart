/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Customer implements _i1.SerializableModel {
  Customer._({
    this.id,
    required this.name,
    this.email,
    this.info,
    this.subscriptionStatus,
    this.createdAt,
  });

  factory Customer({
    _i1.UuidValue? id,
    required String name,
    String? email,
    String? info,
    String? subscriptionStatus,
    DateTime? createdAt,
  }) = _CustomerImpl;

  factory Customer.fromJson(Map<String, dynamic> jsonSerialization) {
    return Customer(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
      email: jsonSerialization['email'] as String?,
      info: jsonSerialization['info'] as String?,
      subscriptionStatus: jsonSerialization['subscriptionStatus'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  String name;

  String? email;

  String? info;

  String? subscriptionStatus;

  DateTime? createdAt;

  /// Returns a shallow copy of this [Customer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Customer copyWith({
    _i1.UuidValue? id,
    String? name,
    String? email,
    String? info,
    String? subscriptionStatus,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id?.toJson(),
      'name': name,
      if (email != null) 'email': email,
      if (info != null) 'info': info,
      if (subscriptionStatus != null) 'subscriptionStatus': subscriptionStatus,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomerImpl extends Customer {
  _CustomerImpl({
    _i1.UuidValue? id,
    required String name,
    String? email,
    String? info,
    String? subscriptionStatus,
    DateTime? createdAt,
  }) : super._(
          id: id,
          name: name,
          email: email,
          info: info,
          subscriptionStatus: subscriptionStatus,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [Customer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Customer copyWith({
    Object? id = _Undefined,
    String? name,
    Object? email = _Undefined,
    Object? info = _Undefined,
    Object? subscriptionStatus = _Undefined,
    Object? createdAt = _Undefined,
  }) {
    return Customer(
      id: id is _i1.UuidValue? ? id : this.id,
      name: name ?? this.name,
      email: email is String? ? email : this.email,
      info: info is String? ? info : this.info,
      subscriptionStatus: subscriptionStatus is String?
          ? subscriptionStatus
          : this.subscriptionStatus,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
    );
  }
}
