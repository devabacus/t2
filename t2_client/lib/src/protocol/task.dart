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
import 'task_tag_map.dart' as _i2;

abstract class Task implements _i1.SerializableModel {
  Task._({
    this.id,
    bool? isDeleted,
    this.lastModified,
    required this.userId,
    required this.title,
    this.categoryId,
    this.taskTagMaps,
  }) : isDeleted = isDeleted ?? false;

  factory Task({
    _i1.UuidValue? id,
    bool? isDeleted,
    DateTime? lastModified,
    required int userId,
    required String title,
    _i1.UuidValue? categoryId,
    List<_i2.TaskTagMap>? taskTagMaps,
  }) = _TaskImpl;

  factory Task.fromJson(Map<String, dynamic> jsonSerialization) {
    return Task(
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
      categoryId: jsonSerialization['categoryId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['categoryId']),
      taskTagMaps: (jsonSerialization['taskTagMaps'] as List?)
          ?.map((e) => _i2.TaskTagMap.fromJson((e as Map<String, dynamic>)))
          .toList(),
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

  _i1.UuidValue? categoryId;

  List<_i2.TaskTagMap>? taskTagMaps;

  /// Returns a shallow copy of this [Task]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Task copyWith({
    _i1.UuidValue? id,
    bool? isDeleted,
    DateTime? lastModified,
    int? userId,
    String? title,
    _i1.UuidValue? categoryId,
    List<_i2.TaskTagMap>? taskTagMaps,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id?.toJson(),
      'isDeleted': isDeleted,
      if (lastModified != null) 'lastModified': lastModified?.toJson(),
      'userId': userId,
      'title': title,
      if (categoryId != null) 'categoryId': categoryId?.toJson(),
      if (taskTagMaps != null)
        'taskTagMaps': taskTagMaps?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TaskImpl extends Task {
  _TaskImpl({
    _i1.UuidValue? id,
    bool? isDeleted,
    DateTime? lastModified,
    required int userId,
    required String title,
    _i1.UuidValue? categoryId,
    List<_i2.TaskTagMap>? taskTagMaps,
  }) : super._(
          id: id,
          isDeleted: isDeleted,
          lastModified: lastModified,
          userId: userId,
          title: title,
          categoryId: categoryId,
          taskTagMaps: taskTagMaps,
        );

  /// Returns a shallow copy of this [Task]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Task copyWith({
    Object? id = _Undefined,
    bool? isDeleted,
    Object? lastModified = _Undefined,
    int? userId,
    String? title,
    Object? categoryId = _Undefined,
    Object? taskTagMaps = _Undefined,
  }) {
    return Task(
      id: id is _i1.UuidValue? ? id : this.id,
      isDeleted: isDeleted ?? this.isDeleted,
      lastModified:
          lastModified is DateTime? ? lastModified : this.lastModified,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      categoryId: categoryId is _i1.UuidValue? ? categoryId : this.categoryId,
      taskTagMaps: taskTagMaps is List<_i2.TaskTagMap>?
          ? taskTagMaps
          : this.taskTagMaps?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
