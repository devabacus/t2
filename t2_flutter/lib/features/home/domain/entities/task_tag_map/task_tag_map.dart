import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_tag_map.freezed.dart';
part 'task_tag_map.g.dart';

@freezed
abstract class TaskTagMapEntity with _$TaskTagMapEntity {
  const factory TaskTagMapEntity({
    required String id,
    required DateTime lastModified,
    required int userId,
    required String taskId,
    required String tagId,
  }) = _TaskTagMapEntity;

  factory TaskTagMapEntity.fromJson(Map<String, dynamic> json) => _$TaskTagMapEntityFromJson(json);
}
