import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_entity.freezed.dart';
part 'tag_entity.g.dart';

@freezed
abstract class TagEntity with _$TagEntity {
  const factory TagEntity({
    required String id,
    required int userId,
    required String customerId,
    required DateTime createdAt,
    required DateTime lastModified,
    @Default(false) bool isDeleted,
    required String title,
  }) = _TagEntity;

  factory TagEntity.fromJson(Map<String, dynamic> json) => _$TagEntityFromJson(json);
}
