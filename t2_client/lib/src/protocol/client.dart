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
import 'dart:async' as _i2;
import 'package:t2_client/src/protocol/user/user_details.dart' as _i3;
import 'package:uuid/uuid_value.dart' as _i4;
import 'package:t2_client/src/protocol/user/role.dart' as _i5;
import 'package:t2_client/src/protocol/user/permission.dart' as _i6;
import 'package:t2_client/src/protocol/category.dart' as _i7;
import 'package:t2_client/src/protocol/category_sync_event.dart' as _i8;
import 'package:t2_client/src/protocol/configuration.dart' as _i9;
import 'package:t2_client/src/protocol/configuration_sync_event.dart' as _i10;
import 'package:t2_client/src/protocol/tag.dart' as _i11;
import 'package:t2_client/src/protocol/tag_sync_event.dart' as _i12;
import 'package:t2_client/src/protocol/task.dart' as _i13;
import 'package:t2_client/src/protocol/task_sync_event.dart' as _i14;
import 'package:t2_client/src/protocol/task_tag_map.dart' as _i15;
import 'package:t2_client/src/protocol/task_tag_map_sync_event.dart' as _i16;
import 'package:t2_client/src/protocol/test_data.dart' as _i17;
import 'package:t2_client/src/protocol/user/user_session_data.dart' as _i18;
import 'package:t2_client/src/protocol/greeting.dart' as _i19;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i20;
import 'protocol.dart' as _i21;

/// {@category Endpoint}
class EndpointAdmin extends _i1.EndpointRef {
  EndpointAdmin(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'admin';

  _i2.Future<List<_i3.UserDetails>> listUsers() =>
      caller.callServerEndpoint<List<_i3.UserDetails>>(
        'admin',
        'listUsers',
        {},
      );

  _i2.Future<bool> updateUserRole({
    required int userId,
    required _i4.UuidValue roleId,
  }) =>
      caller.callServerEndpoint<bool>(
        'admin',
        'updateUserRole',
        {
          'userId': userId,
          'roleId': roleId,
        },
      );

  _i2.Future<List<_i5.Role>> listRoles() =>
      caller.callServerEndpoint<List<_i5.Role>>(
        'admin',
        'listRoles',
        {},
      );

  _i2.Future<List<_i6.Permission>> listPermissions() =>
      caller.callServerEndpoint<List<_i6.Permission>>(
        'admin',
        'listPermissions',
        {},
      );

  _i2.Future<_i5.Role> createOrUpdateRole(
    _i5.Role role,
    List<_i4.UuidValue> permissionIds,
  ) =>
      caller.callServerEndpoint<_i5.Role>(
        'admin',
        'createOrUpdateRole',
        {
          'role': role,
          'permissionIds': permissionIds,
        },
      );

  _i2.Future<bool> deleteRole(_i4.UuidValue roleId) =>
      caller.callServerEndpoint<bool>(
        'admin',
        'deleteRole',
        {'roleId': roleId},
      );
}

/// {@category Endpoint}
class EndpointCategory extends _i1.EndpointRef {
  EndpointCategory(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'category';

  _i2.Future<_i7.Category> createCategory(_i7.Category category) =>
      caller.callServerEndpoint<_i7.Category>(
        'category',
        'createCategory',
        {'category': category},
      );

  _i2.Future<List<_i7.Category>> getCategories({int? limit}) =>
      caller.callServerEndpoint<List<_i7.Category>>(
        'category',
        'getCategories',
        {'limit': limit},
      );

  _i2.Future<_i7.Category?> getCategoryById(_i4.UuidValue id) =>
      caller.callServerEndpoint<_i7.Category?>(
        'category',
        'getCategoryById',
        {'id': id},
      );

  _i2.Future<List<_i7.Category>> getCategoriesSince(DateTime? since) =>
      caller.callServerEndpoint<List<_i7.Category>>(
        'category',
        'getCategoriesSince',
        {'since': since},
      );

  _i2.Future<bool> updateCategory(_i7.Category category) =>
      caller.callServerEndpoint<bool>(
        'category',
        'updateCategory',
        {'category': category},
      );

  _i2.Stream<_i8.CategorySyncEvent> watchEvents() =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i8.CategorySyncEvent>,
          _i8.CategorySyncEvent>(
        'category',
        'watchEvents',
        {},
        {},
      );
}

/// {@category Endpoint}
class EndpointConfiguration extends _i1.EndpointRef {
  EndpointConfiguration(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'configuration';

  _i2.Future<_i9.Configuration> createConfiguration(
          _i9.Configuration configuration) =>
      caller.callServerEndpoint<_i9.Configuration>(
        'configuration',
        'createConfiguration',
        {'configuration': configuration},
      );

  _i2.Future<List<_i9.Configuration>> getConfigurations({int? limit}) =>
      caller.callServerEndpoint<List<_i9.Configuration>>(
        'configuration',
        'getConfigurations',
        {'limit': limit},
      );

  _i2.Future<_i9.Configuration?> getConfigurationById(_i4.UuidValue id) =>
      caller.callServerEndpoint<_i9.Configuration?>(
        'configuration',
        'getConfigurationById',
        {'id': id},
      );

  _i2.Future<List<_i9.Configuration>> getConfigurationsSince(DateTime? since) =>
      caller.callServerEndpoint<List<_i9.Configuration>>(
        'configuration',
        'getConfigurationsSince',
        {'since': since},
      );

  _i2.Future<bool> updateConfiguration(_i9.Configuration configuration) =>
      caller.callServerEndpoint<bool>(
        'configuration',
        'updateConfiguration',
        {'configuration': configuration},
      );

  _i2.Stream<_i10.ConfigurationSyncEvent> watchEvents() =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i10.ConfigurationSyncEvent>, _i10.ConfigurationSyncEvent>(
        'configuration',
        'watchEvents',
        {},
        {},
      );
}

/// {@category Endpoint}
class EndpointTag extends _i1.EndpointRef {
  EndpointTag(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'tag';

  _i2.Future<_i11.Tag> createTag(_i11.Tag tag) =>
      caller.callServerEndpoint<_i11.Tag>(
        'tag',
        'createTag',
        {'tag': tag},
      );

  _i2.Future<List<_i11.Tag>> getTags({int? limit}) =>
      caller.callServerEndpoint<List<_i11.Tag>>(
        'tag',
        'getTags',
        {'limit': limit},
      );

  _i2.Future<_i11.Tag?> getTagById(_i4.UuidValue id) =>
      caller.callServerEndpoint<_i11.Tag?>(
        'tag',
        'getTagById',
        {'id': id},
      );

  _i2.Future<List<_i11.Tag>> getTagsSince(DateTime? since) =>
      caller.callServerEndpoint<List<_i11.Tag>>(
        'tag',
        'getTagsSince',
        {'since': since},
      );

  _i2.Future<bool> updateTag(_i11.Tag tag) => caller.callServerEndpoint<bool>(
        'tag',
        'updateTag',
        {'tag': tag},
      );

  _i2.Stream<_i12.TagSyncEvent> watchEvents() =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i12.TagSyncEvent>,
          _i12.TagSyncEvent>(
        'tag',
        'watchEvents',
        {},
        {},
      );
}

/// {@category Endpoint}
class EndpointTask extends _i1.EndpointRef {
  EndpointTask(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'task';

  _i2.Future<_i13.Task> createTask(_i13.Task task) =>
      caller.callServerEndpoint<_i13.Task>(
        'task',
        'createTask',
        {'task': task},
      );

  _i2.Future<List<_i13.Task>> getTasks({int? limit}) =>
      caller.callServerEndpoint<List<_i13.Task>>(
        'task',
        'getTasks',
        {'limit': limit},
      );

  _i2.Future<_i13.Task?> getTaskById(_i4.UuidValue id) =>
      caller.callServerEndpoint<_i13.Task?>(
        'task',
        'getTaskById',
        {'id': id},
      );

  _i2.Future<List<_i13.Task>> getTasksSince(DateTime? since) =>
      caller.callServerEndpoint<List<_i13.Task>>(
        'task',
        'getTasksSince',
        {'since': since},
      );

  _i2.Future<bool> updateTask(_i13.Task task) =>
      caller.callServerEndpoint<bool>(
        'task',
        'updateTask',
        {'task': task},
      );

  _i2.Stream<_i14.TaskSyncEvent> watchEvents() =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i14.TaskSyncEvent>,
          _i14.TaskSyncEvent>(
        'task',
        'watchEvents',
        {},
        {},
      );

  _i2.Future<List<_i13.Task>> getTasksByCategoryId(_i4.UuidValue categoryId) =>
      caller.callServerEndpoint<List<_i13.Task>>(
        'task',
        'getTasksByCategoryId',
        {'categoryId': categoryId},
      );
}

/// {@category Endpoint}
class EndpointTaskTagMap extends _i1.EndpointRef {
  EndpointTaskTagMap(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'taskTagMap';

  _i2.Future<_i15.TaskTagMap> createTaskTagMap(_i15.TaskTagMap taskTagMap) =>
      caller.callServerEndpoint<_i15.TaskTagMap>(
        'taskTagMap',
        'createTaskTagMap',
        {'taskTagMap': taskTagMap},
      );

  _i2.Future<List<_i11.Tag>> getTagsForTask(_i4.UuidValue taskId) =>
      caller.callServerEndpoint<List<_i11.Tag>>(
        'taskTagMap',
        'getTagsForTask',
        {'taskId': taskId},
      );

  _i2.Future<List<_i13.Task>> getTasksForTag(_i4.UuidValue tagId) =>
      caller.callServerEndpoint<List<_i13.Task>>(
        'taskTagMap',
        'getTasksForTag',
        {'tagId': tagId},
      );

  _i2.Future<List<_i15.TaskTagMap>> getTaskTagMapsSince(DateTime? since) =>
      caller.callServerEndpoint<List<_i15.TaskTagMap>>(
        'taskTagMap',
        'getTaskTagMapsSince',
        {'since': since},
      );

  _i2.Stream<_i16.TaskTagMapSyncEvent> watchEvents() =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i16.TaskTagMapSyncEvent>,
          _i16.TaskTagMapSyncEvent>(
        'taskTagMap',
        'watchEvents',
        {},
        {},
      );

  _i2.Future<bool> deleteTaskTagMapByTaskAndTag(
    _i4.UuidValue taskId,
    _i4.UuidValue tagId,
  ) =>
      caller.callServerEndpoint<bool>(
        'taskTagMap',
        'deleteTaskTagMapByTaskAndTag',
        {
          'taskId': taskId,
          'tagId': tagId,
        },
      );
}

/// {@category Endpoint}
class EndpointTestData extends _i1.EndpointRef {
  EndpointTestData(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'testData';

  /// Создает новую запись TestData в базе данных.
  _i2.Future<_i17.TestData> createTestData(_i17.TestData testData) =>
      caller.callServerEndpoint<_i17.TestData>(
        'testData',
        'createTestData',
        {'testData': testData},
      );

  /// Возвращает список всех записей.
  _i2.Future<List<_i17.TestData>> listTestDatas() =>
      caller.callServerEndpoint<List<_i17.TestData>>(
        'testData',
        'listTestDatas',
        {},
      );

  /// Обновляет существующую запись.
  _i2.Future<_i17.TestData> updateTestData(_i17.TestData testData) =>
      caller.callServerEndpoint<_i17.TestData>(
        'testData',
        'updateTestData',
        {'testData': testData},
      );

  /// Удаляет запись.
  _i2.Future<bool> deleteTestData(_i17.TestData testData) =>
      caller.callServerEndpoint<bool>(
        'testData',
        'deleteTestData',
        {'testData': testData},
      );
}

/// {@category Endpoint}
class EndpointUserManagement extends _i1.EndpointRef {
  EndpointUserManagement(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userManagement';

  _i2.Future<_i18.UserSessionData?> getMyUserContext() =>
      caller.callServerEndpoint<_i18.UserSessionData?>(
        'userManagement',
        'getMyUserContext',
        {},
      );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i1.EndpointRef {
  EndpointGreeting(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i2.Future<_i19.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i19.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i20.Caller(client);
  }

  late final _i20.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i21.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    admin = EndpointAdmin(this);
    category = EndpointCategory(this);
    configuration = EndpointConfiguration(this);
    tag = EndpointTag(this);
    task = EndpointTask(this);
    taskTagMap = EndpointTaskTagMap(this);
    testData = EndpointTestData(this);
    userManagement = EndpointUserManagement(this);
    greeting = EndpointGreeting(this);
    modules = Modules(this);
  }

  late final EndpointAdmin admin;

  late final EndpointCategory category;

  late final EndpointConfiguration configuration;

  late final EndpointTag tag;

  late final EndpointTask task;

  late final EndpointTaskTagMap taskTagMap;

  late final EndpointTestData testData;

  late final EndpointUserManagement userManagement;

  late final EndpointGreeting greeting;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'admin': admin,
        'category': category,
        'configuration': configuration,
        'tag': tag,
        'task': task,
        'taskTagMap': taskTagMap,
        'testData': testData,
        'userManagement': userManagement,
        'greeting': greeting,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
