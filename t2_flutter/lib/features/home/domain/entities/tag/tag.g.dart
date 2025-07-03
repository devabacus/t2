// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TagEntity _$TagEntityFromJson(Map<String, dynamic> json) => _TagEntity(
  id: json['id'] as String,
  lastModified: DateTime.parse(json['lastModified'] as String),
  userId: (json['userId'] as num).toInt(),
  title: json['title'] as String,
);

Map<String, dynamic> _$TagEntityToJson(_TagEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastModified': instance.lastModified.toIso8601String(),
      'userId': instance.userId,
      'title': instance.title,
    };
