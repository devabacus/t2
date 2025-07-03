// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskEntity _$TaskEntityFromJson(Map<String, dynamic> json) => _TaskEntity(
  id: json['id'] as String,
  lastModified: DateTime.parse(json['lastModified'] as String),
  userId: (json['userId'] as num).toInt(),
  title: json['title'] as String,
  categoryId: json['categoryId'] as String?,
);

Map<String, dynamic> _$TaskEntityToJson(_TaskEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastModified': instance.lastModified.toIso8601String(),
      'userId': instance.userId,
      'title': instance.title,
      'categoryId': instance.categoryId,
    };
