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
import 'greeting.dart' as _i2;
import 'category.dart' as _i3;
import 'category_sync_event.dart' as _i4;
import 'customer.dart' as _i5;
import 'sync_event_type.dart' as _i6;
import 'tag.dart' as _i7;
import 'tag_sync_event.dart' as _i8;
import 'task.dart' as _i9;
import 'task_sync_event.dart' as _i10;
import 'task_tag_map.dart' as _i11;
import 'task_tag_map_sync_event.dart' as _i12;
import 'test_data.dart' as _i13;
import 'package:t2_client/src/protocol/category.dart' as _i14;
import 'package:t2_client/src/protocol/tag.dart' as _i15;
import 'package:t2_client/src/protocol/task.dart' as _i16;
import 'package:t2_client/src/protocol/task_tag_map.dart' as _i17;
import 'package:t2_client/src/protocol/test_data.dart' as _i18;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i19;
export 'greeting.dart';
export 'category.dart';
export 'category_sync_event.dart';
export 'customer.dart';
export 'sync_event_type.dart';
export 'tag.dart';
export 'tag_sync_event.dart';
export 'task.dart';
export 'task_sync_event.dart';
export 'task_tag_map.dart';
export 'task_tag_map_sync_event.dart';
export 'test_data.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Greeting) {
      return _i2.Greeting.fromJson(data) as T;
    }
    if (t == _i3.Category) {
      return _i3.Category.fromJson(data) as T;
    }
    if (t == _i4.CategorySyncEvent) {
      return _i4.CategorySyncEvent.fromJson(data) as T;
    }
    if (t == _i5.Customer) {
      return _i5.Customer.fromJson(data) as T;
    }
    if (t == _i6.SyncEventType) {
      return _i6.SyncEventType.fromJson(data) as T;
    }
    if (t == _i7.Tag) {
      return _i7.Tag.fromJson(data) as T;
    }
    if (t == _i8.TagSyncEvent) {
      return _i8.TagSyncEvent.fromJson(data) as T;
    }
    if (t == _i9.Task) {
      return _i9.Task.fromJson(data) as T;
    }
    if (t == _i10.TaskSyncEvent) {
      return _i10.TaskSyncEvent.fromJson(data) as T;
    }
    if (t == _i11.TaskTagMap) {
      return _i11.TaskTagMap.fromJson(data) as T;
    }
    if (t == _i12.TaskTagMapSyncEvent) {
      return _i12.TaskTagMapSyncEvent.fromJson(data) as T;
    }
    if (t == _i13.TestData) {
      return _i13.TestData.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Greeting?>()) {
      return (data != null ? _i2.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Category?>()) {
      return (data != null ? _i3.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.CategorySyncEvent?>()) {
      return (data != null ? _i4.CategorySyncEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Customer?>()) {
      return (data != null ? _i5.Customer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.SyncEventType?>()) {
      return (data != null ? _i6.SyncEventType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Tag?>()) {
      return (data != null ? _i7.Tag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.TagSyncEvent?>()) {
      return (data != null ? _i8.TagSyncEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Task?>()) {
      return (data != null ? _i9.Task.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.TaskSyncEvent?>()) {
      return (data != null ? _i10.TaskSyncEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.TaskTagMap?>()) {
      return (data != null ? _i11.TaskTagMap.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.TaskTagMapSyncEvent?>()) {
      return (data != null ? _i12.TaskTagMapSyncEvent.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i13.TestData?>()) {
      return (data != null ? _i13.TestData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i11.TaskTagMap>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i11.TaskTagMap>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i11.TaskTagMap>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i11.TaskTagMap>(e)).toList()
          : null) as T;
    }
    if (t == List<_i14.Category>) {
      return (data as List).map((e) => deserialize<_i14.Category>(e)).toList()
          as T;
    }
    if (t == List<_i15.Tag>) {
      return (data as List).map((e) => deserialize<_i15.Tag>(e)).toList() as T;
    }
    if (t == List<_i16.Task>) {
      return (data as List).map((e) => deserialize<_i16.Task>(e)).toList() as T;
    }
    if (t == List<_i17.TaskTagMap>) {
      return (data as List).map((e) => deserialize<_i17.TaskTagMap>(e)).toList()
          as T;
    }
    if (t == List<_i18.TestData>) {
      return (data as List).map((e) => deserialize<_i18.TestData>(e)).toList()
          as T;
    }
    try {
      return _i19.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Greeting) {
      return 'Greeting';
    }
    if (data is _i3.Category) {
      return 'Category';
    }
    if (data is _i4.CategorySyncEvent) {
      return 'CategorySyncEvent';
    }
    if (data is _i5.Customer) {
      return 'Customer';
    }
    if (data is _i6.SyncEventType) {
      return 'SyncEventType';
    }
    if (data is _i7.Tag) {
      return 'Tag';
    }
    if (data is _i8.TagSyncEvent) {
      return 'TagSyncEvent';
    }
    if (data is _i9.Task) {
      return 'Task';
    }
    if (data is _i10.TaskSyncEvent) {
      return 'TaskSyncEvent';
    }
    if (data is _i11.TaskTagMap) {
      return 'TaskTagMap';
    }
    if (data is _i12.TaskTagMapSyncEvent) {
      return 'TaskTagMapSyncEvent';
    }
    if (data is _i13.TestData) {
      return 'TestData';
    }
    className = _i19.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i2.Greeting>(data['data']);
    }
    if (dataClassName == 'Category') {
      return deserialize<_i3.Category>(data['data']);
    }
    if (dataClassName == 'CategorySyncEvent') {
      return deserialize<_i4.CategorySyncEvent>(data['data']);
    }
    if (dataClassName == 'Customer') {
      return deserialize<_i5.Customer>(data['data']);
    }
    if (dataClassName == 'SyncEventType') {
      return deserialize<_i6.SyncEventType>(data['data']);
    }
    if (dataClassName == 'Tag') {
      return deserialize<_i7.Tag>(data['data']);
    }
    if (dataClassName == 'TagSyncEvent') {
      return deserialize<_i8.TagSyncEvent>(data['data']);
    }
    if (dataClassName == 'Task') {
      return deserialize<_i9.Task>(data['data']);
    }
    if (dataClassName == 'TaskSyncEvent') {
      return deserialize<_i10.TaskSyncEvent>(data['data']);
    }
    if (dataClassName == 'TaskTagMap') {
      return deserialize<_i11.TaskTagMap>(data['data']);
    }
    if (dataClassName == 'TaskTagMapSyncEvent') {
      return deserialize<_i12.TaskTagMapSyncEvent>(data['data']);
    }
    if (dataClassName == 'TestData') {
      return deserialize<_i13.TestData>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i19.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
