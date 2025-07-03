// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_tag_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskTagMapEntity _$TaskTagMapEntityFromJson(Map<String, dynamic> json) =>
    _TaskTagMapEntity(
      id: json['id'] as String,
      lastModified: DateTime.parse(json['lastModified'] as String),
      userId: (json['userId'] as num).toInt(),
      taskId: json['taskId'] as String,
      tagId: json['tagId'] as String,
    );

Map<String, dynamic> _$TaskTagMapEntityToJson(_TaskTagMapEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastModified': instance.lastModified.toIso8601String(),
      'userId': instance.userId,
      'taskId': instance.taskId,
      'tagId': instance.tagId,
    };
