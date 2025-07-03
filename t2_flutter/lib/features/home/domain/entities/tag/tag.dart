import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.freezed.dart';
part 'tag.g.dart';

@freezed
abstract class TagEntity with _$TagEntity {
  const factory TagEntity({
    required String id,
    required DateTime lastModified,
    required int userId,
    required String title,
  }) = _TagEntity;

  factory TagEntity.fromJson(Map<String, dynamic> json) => _$TagEntityFromJson(json);
}
