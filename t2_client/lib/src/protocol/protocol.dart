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
import 'configuration.dart' as _i5;
import 'configuration_sync_event.dart' as _i6;
import 'sync_event_type.dart' as _i7;
import 'tag.dart' as _i8;
import 'tag_sync_event.dart' as _i9;
import 'task.dart' as _i10;
import 'task_sync_event.dart' as _i11;
import 'task_tag_map.dart' as _i12;
import 'task_tag_map_sync_event.dart' as _i13;
import 'test_data.dart' as _i14;
import 'user/customer.dart' as _i15;
import 'user/customer_user.dart' as _i16;
import 'user/permission.dart' as _i17;
import 'user/role.dart' as _i18;
import 'user/role_permission.dart' as _i19;
import 'user/super_admin_dashboard.dart' as _i20;
import 'user/super_user_details.dart' as _i21;
import 'user/user_details.dart' as _i22;
import 'user/user_session_data.dart' as _i23;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i24;
import 'package:t2_client/src/protocol/user/user_details.dart' as _i25;
import 'package:t2_client/src/protocol/user/role.dart' as _i26;
import 'package:t2_client/src/protocol/user/permission.dart' as _i27;
import 'package:uuid/uuid_value.dart' as _i28;
import 'package:t2_client/src/protocol/category.dart' as _i29;
import 'package:t2_client/src/protocol/configuration.dart' as _i30;
import 'package:t2_client/src/protocol/tag.dart' as _i31;
import 'package:t2_client/src/protocol/task.dart' as _i32;
import 'package:t2_client/src/protocol/task_tag_map.dart' as _i33;
import 'package:t2_client/src/protocol/test_data.dart' as _i34;
export 'greeting.dart';
export 'category.dart';
export 'category_sync_event.dart';
export 'configuration.dart';
export 'configuration_sync_event.dart';
export 'sync_event_type.dart';
export 'tag.dart';
export 'tag_sync_event.dart';
export 'task.dart';
export 'task_sync_event.dart';
export 'task_tag_map.dart';
export 'task_tag_map_sync_event.dart';
export 'test_data.dart';
export 'user/customer.dart';
export 'user/customer_user.dart';
export 'user/permission.dart';
export 'user/role.dart';
export 'user/role_permission.dart';
export 'user/super_admin_dashboard.dart';
export 'user/super_user_details.dart';
export 'user/user_details.dart';
export 'user/user_session_data.dart';
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
    if (t == _i5.Configuration) {
      return _i5.Configuration.fromJson(data) as T;
    }
    if (t == _i6.ConfigurationSyncEvent) {
      return _i6.ConfigurationSyncEvent.fromJson(data) as T;
    }
    if (t == _i7.SyncEventType) {
      return _i7.SyncEventType.fromJson(data) as T;
    }
    if (t == _i8.Tag) {
      return _i8.Tag.fromJson(data) as T;
    }
    if (t == _i9.TagSyncEvent) {
      return _i9.TagSyncEvent.fromJson(data) as T;
    }
    if (t == _i10.Task) {
      return _i10.Task.fromJson(data) as T;
    }
    if (t == _i11.TaskSyncEvent) {
      return _i11.TaskSyncEvent.fromJson(data) as T;
    }
    if (t == _i12.TaskTagMap) {
      return _i12.TaskTagMap.fromJson(data) as T;
    }
    if (t == _i13.TaskTagMapSyncEvent) {
      return _i13.TaskTagMapSyncEvent.fromJson(data) as T;
    }
    if (t == _i14.TestData) {
      return _i14.TestData.fromJson(data) as T;
    }
    if (t == _i15.Customer) {
      return _i15.Customer.fromJson(data) as T;
    }
    if (t == _i16.CustomerUser) {
      return _i16.CustomerUser.fromJson(data) as T;
    }
    if (t == _i17.Permission) {
      return _i17.Permission.fromJson(data) as T;
    }
    if (t == _i18.Role) {
      return _i18.Role.fromJson(data) as T;
    }
    if (t == _i19.RolePermission) {
      return _i19.RolePermission.fromJson(data) as T;
    }
    if (t == _i20.SuperAdminDashboard) {
      return _i20.SuperAdminDashboard.fromJson(data) as T;
    }
    if (t == _i21.SuperUserDetails) {
      return _i21.SuperUserDetails.fromJson(data) as T;
    }
    if (t == _i22.UserDetails) {
      return _i22.UserDetails.fromJson(data) as T;
    }
    if (t == _i23.UserSessionData) {
      return _i23.UserSessionData.fromJson(data) as T;
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
    if (t == _i1.getType<_i5.Configuration?>()) {
      return (data != null ? _i5.Configuration.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.ConfigurationSyncEvent?>()) {
      return (data != null ? _i6.ConfigurationSyncEvent.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.SyncEventType?>()) {
      return (data != null ? _i7.SyncEventType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Tag?>()) {
      return (data != null ? _i8.Tag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.TagSyncEvent?>()) {
      return (data != null ? _i9.TagSyncEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Task?>()) {
      return (data != null ? _i10.Task.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.TaskSyncEvent?>()) {
      return (data != null ? _i11.TaskSyncEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.TaskTagMap?>()) {
      return (data != null ? _i12.TaskTagMap.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.TaskTagMapSyncEvent?>()) {
      return (data != null ? _i13.TaskTagMapSyncEvent.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i14.TestData?>()) {
      return (data != null ? _i14.TestData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Customer?>()) {
      return (data != null ? _i15.Customer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.CustomerUser?>()) {
      return (data != null ? _i16.CustomerUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.Permission?>()) {
      return (data != null ? _i17.Permission.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Role?>()) {
      return (data != null ? _i18.Role.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.RolePermission?>()) {
      return (data != null ? _i19.RolePermission.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.SuperAdminDashboard?>()) {
      return (data != null ? _i20.SuperAdminDashboard.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i21.SuperUserDetails?>()) {
      return (data != null ? _i21.SuperUserDetails.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.UserDetails?>()) {
      return (data != null ? _i22.UserDetails.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.UserSessionData?>()) {
      return (data != null ? _i23.UserSessionData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i12.TaskTagMap>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i12.TaskTagMap>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i12.TaskTagMap>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i12.TaskTagMap>(e)).toList()
          : null) as T;
    }
    if (t == List<_i24.UserInfo>) {
      return (data as List).map((e) => deserialize<_i24.UserInfo>(e)).toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i25.UserDetails>) {
      return (data as List)
          .map((e) => deserialize<_i25.UserDetails>(e))
          .toList() as T;
    }
    if (t == List<_i26.Role>) {
      return (data as List).map((e) => deserialize<_i26.Role>(e)).toList() as T;
    }
    if (t == List<_i27.Permission>) {
      return (data as List).map((e) => deserialize<_i27.Permission>(e)).toList()
          as T;
    }
    if (t == List<_i28.UuidValue>) {
      return (data as List).map((e) => deserialize<_i28.UuidValue>(e)).toList()
          as T;
    }
    if (t == List<_i29.Category>) {
      return (data as List).map((e) => deserialize<_i29.Category>(e)).toList()
          as T;
    }
    if (t == List<_i30.Configuration>) {
      return (data as List)
          .map((e) => deserialize<_i30.Configuration>(e))
          .toList() as T;
    }
    if (t == List<_i31.Tag>) {
      return (data as List).map((e) => deserialize<_i31.Tag>(e)).toList() as T;
    }
    if (t == List<_i32.Task>) {
      return (data as List).map((e) => deserialize<_i32.Task>(e)).toList() as T;
    }
    if (t == List<_i33.TaskTagMap>) {
      return (data as List).map((e) => deserialize<_i33.TaskTagMap>(e)).toList()
          as T;
    }
    if (t == List<_i34.TestData>) {
      return (data as List).map((e) => deserialize<_i34.TestData>(e)).toList()
          as T;
    }
    try {
      return _i24.Protocol().deserialize<T>(data, t);
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
    if (data is _i5.Configuration) {
      return 'Configuration';
    }
    if (data is _i6.ConfigurationSyncEvent) {
      return 'ConfigurationSyncEvent';
    }
    if (data is _i7.SyncEventType) {
      return 'SyncEventType';
    }
    if (data is _i8.Tag) {
      return 'Tag';
    }
    if (data is _i9.TagSyncEvent) {
      return 'TagSyncEvent';
    }
    if (data is _i10.Task) {
      return 'Task';
    }
    if (data is _i11.TaskSyncEvent) {
      return 'TaskSyncEvent';
    }
    if (data is _i12.TaskTagMap) {
      return 'TaskTagMap';
    }
    if (data is _i13.TaskTagMapSyncEvent) {
      return 'TaskTagMapSyncEvent';
    }
    if (data is _i14.TestData) {
      return 'TestData';
    }
    if (data is _i15.Customer) {
      return 'Customer';
    }
    if (data is _i16.CustomerUser) {
      return 'CustomerUser';
    }
    if (data is _i17.Permission) {
      return 'Permission';
    }
    if (data is _i18.Role) {
      return 'Role';
    }
    if (data is _i19.RolePermission) {
      return 'RolePermission';
    }
    if (data is _i20.SuperAdminDashboard) {
      return 'SuperAdminDashboard';
    }
    if (data is _i21.SuperUserDetails) {
      return 'SuperUserDetails';
    }
    if (data is _i22.UserDetails) {
      return 'UserDetails';
    }
    if (data is _i23.UserSessionData) {
      return 'UserSessionData';
    }
    className = _i24.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'Configuration') {
      return deserialize<_i5.Configuration>(data['data']);
    }
    if (dataClassName == 'ConfigurationSyncEvent') {
      return deserialize<_i6.ConfigurationSyncEvent>(data['data']);
    }
    if (dataClassName == 'SyncEventType') {
      return deserialize<_i7.SyncEventType>(data['data']);
    }
    if (dataClassName == 'Tag') {
      return deserialize<_i8.Tag>(data['data']);
    }
    if (dataClassName == 'TagSyncEvent') {
      return deserialize<_i9.TagSyncEvent>(data['data']);
    }
    if (dataClassName == 'Task') {
      return deserialize<_i10.Task>(data['data']);
    }
    if (dataClassName == 'TaskSyncEvent') {
      return deserialize<_i11.TaskSyncEvent>(data['data']);
    }
    if (dataClassName == 'TaskTagMap') {
      return deserialize<_i12.TaskTagMap>(data['data']);
    }
    if (dataClassName == 'TaskTagMapSyncEvent') {
      return deserialize<_i13.TaskTagMapSyncEvent>(data['data']);
    }
    if (dataClassName == 'TestData') {
      return deserialize<_i14.TestData>(data['data']);
    }
    if (dataClassName == 'Customer') {
      return deserialize<_i15.Customer>(data['data']);
    }
    if (dataClassName == 'CustomerUser') {
      return deserialize<_i16.CustomerUser>(data['data']);
    }
    if (dataClassName == 'Permission') {
      return deserialize<_i17.Permission>(data['data']);
    }
    if (dataClassName == 'Role') {
      return deserialize<_i18.Role>(data['data']);
    }
    if (dataClassName == 'RolePermission') {
      return deserialize<_i19.RolePermission>(data['data']);
    }
    if (dataClassName == 'SuperAdminDashboard') {
      return deserialize<_i20.SuperAdminDashboard>(data['data']);
    }
    if (dataClassName == 'SuperUserDetails') {
      return deserialize<_i21.SuperUserDetails>(data['data']);
    }
    if (dataClassName == 'UserDetails') {
      return deserialize<_i22.UserDetails>(data['data']);
    }
    if (dataClassName == 'UserSessionData') {
      return deserialize<_i23.UserSessionData>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i24.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
