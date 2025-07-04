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

abstract class TaskTagMap implements _i1.SerializableModel {
  TaskTagMap._({
    this.id,
    required this.userId,
    required this.customerId,
    required this.createdAt,
    required this.lastModified,
    bool? isDeleted,
    required this.taskId,
    required this.tagId,
  }) : isDeleted = isDeleted ?? false;

  factory TaskTagMap({
    _i1.UuidValue? id,
    required int userId,
    required _i1.UuidValue customerId,
    required DateTime createdAt,
    required DateTime lastModified,
    bool? isDeleted,
    required _i1.UuidValue taskId,
    required _i1.UuidValue tagId,
  }) = _TaskTagMapImpl;

  factory TaskTagMap.fromJson(Map<String, dynamic> jsonSerialization) {
    return TaskTagMap(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: jsonSerialization['userId'] as int,
      customerId:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['customerId']),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      lastModified:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['lastModified']),
      isDeleted: jsonSerialization['isDeleted'] as bool,
      taskId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['taskId']),
      tagId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['tagId']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  int userId;

  _i1.UuidValue customerId;

  DateTime createdAt;

  DateTime lastModified;

  bool isDeleted;

  _i1.UuidValue taskId;

  _i1.UuidValue tagId;

  /// Returns a shallow copy of this [TaskTagMap]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TaskTagMap copyWith({
    _i1.UuidValue? id,
    int? userId,
    _i1.UuidValue? customerId,
    DateTime? createdAt,
    DateTime? lastModified,
    bool? isDeleted,
    _i1.UuidValue? taskId,
    _i1.UuidValue? tagId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id?.toJson(),
      'userId': userId,
      'customerId': customerId.toJson(),
      'createdAt': createdAt.toJson(),
      'lastModified': lastModified.toJson(),
      'isDeleted': isDeleted,
      'taskId': taskId.toJson(),
      'tagId': tagId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TaskTagMapImpl extends TaskTagMap {
  _TaskTagMapImpl({
    _i1.UuidValue? id,
    required int userId,
    required _i1.UuidValue customerId,
    required DateTime createdAt,
    required DateTime lastModified,
    bool? isDeleted,
    required _i1.UuidValue taskId,
    required _i1.UuidValue tagId,
  }) : super._(
          id: id,
          userId: userId,
          customerId: customerId,
          createdAt: createdAt,
          lastModified: lastModified,
          isDeleted: isDeleted,
          taskId: taskId,
          tagId: tagId,
        );

  /// Returns a shallow copy of this [TaskTagMap]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TaskTagMap copyWith({
    Object? id = _Undefined,
    int? userId,
    _i1.UuidValue? customerId,
    DateTime? createdAt,
    DateTime? lastModified,
    bool? isDeleted,
    _i1.UuidValue? taskId,
    _i1.UuidValue? tagId,
  }) {
    return TaskTagMap(
      id: id is _i1.UuidValue? ? id : this.id,
      userId: userId ?? this.userId,
      customerId: customerId ?? this.customerId,
      createdAt: createdAt ?? this.createdAt,
      lastModified: lastModified ?? this.lastModified,
      isDeleted: isDeleted ?? this.isDeleted,
      taskId: taskId ?? this.taskId,
      tagId: tagId ?? this.tagId,
    );
  }
}
