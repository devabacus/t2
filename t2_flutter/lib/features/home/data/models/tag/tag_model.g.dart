// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TagModel _$TagModelFromJson(Map<String, dynamic> json) => _TagModel(
  id: json['id'] as String,
  lastModified: DateTime.parse(json['lastModified'] as String),
  userId: (json['userId'] as num).toInt(),
  title: json['title'] as String,
);

Map<String, dynamic> _$TagModelToJson(_TagModel instance) => <String, dynamic>{
  'id': instance.id,
  'lastModified': instance.lastModified.toIso8601String(),
  'userId': instance.userId,
  'title': instance.title,
};
