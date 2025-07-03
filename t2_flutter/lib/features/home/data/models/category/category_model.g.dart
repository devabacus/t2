// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    _CategoryModel(
      id: json['id'] as String,
      lastModified: DateTime.parse(json['lastModified'] as String),
      userId: (json['userId'] as num).toInt(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$CategoryModelToJson(_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastModified': instance.lastModified.toIso8601String(),
      'userId': instance.userId,
      'title': instance.title,
    };
