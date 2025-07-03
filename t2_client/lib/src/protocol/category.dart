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

abstract class Category implements _i1.SerializableModel {
  Category._({
    this.id,
    bool? isDeleted,
    this.lastModified,
    required this.userId,
    required this.title,
  }) : isDeleted = isDeleted ?? false;

  factory Category({
    _i1.UuidValue? id,
    bool? isDeleted,
    DateTime? lastModified,
    required int userId,
    required String title,
  }) = _CategoryImpl;

  factory Category.fromJson(Map<String, dynamic> jsonSerialization) {
    return Category(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      isDeleted: jsonSerialization['isDeleted'] as bool,
      lastModified: jsonSerialization['lastModified'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastModified']),
      userId: jsonSerialization['userId'] as int,
      title: jsonSerialization['title'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  bool isDeleted;

  DateTime? lastModified;

  int userId;

  String title;

  /// Returns a shallow copy of this [Category]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Category copyWith({
    _i1.UuidValue? id,
    bool? isDeleted,
    DateTime? lastModified,
    int? userId,
    String? title,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id?.toJson(),
      'isDeleted': isDeleted,
      if (lastModified != null) 'lastModified': lastModified?.toJson(),
      'userId': userId,
      'title': title,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CategoryImpl extends Category {
  _CategoryImpl({
    _i1.UuidValue? id,
    bool? isDeleted,
    DateTime? lastModified,
    required int userId,
    required String title,
  }) : super._(
          id: id,
          isDeleted: isDeleted,
          lastModified: lastModified,
          userId: userId,
          title: title,
        );

  /// Returns a shallow copy of this [Category]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Category copyWith({
    Object? id = _Undefined,
    bool? isDeleted,
    Object? lastModified = _Undefined,
    int? userId,
    String? title,
  }) {
    return Category(
      id: id is _i1.UuidValue? ? id : this.id,
      isDeleted: isDeleted ?? this.isDeleted,
      lastModified:
          lastModified is DateTime? ? lastModified : this.lastModified,
      userId: userId ?? this.userId,
      title: title ?? this.title,
    );
  }
}
