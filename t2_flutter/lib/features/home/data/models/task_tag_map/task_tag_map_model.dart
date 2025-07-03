import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_tag_map_model.freezed.dart';
part 'task_tag_map_model.g.dart';

@freezed
abstract class TaskTagMapModel with _$TaskTagMapModel {
  const factory TaskTagMapModel({
    required String id,
    required DateTime lastModified,
    required int userId,
    required String taskId,
    required String tagId,
  }) = _TaskTagMapModel;

  factory TaskTagMapModel.fromJson(Map<String, dynamic> json) => _$TaskTagMapModelFromJson(json);
}
