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
import 'package:t2_client/src/protocol/category.dart' as _i3;
import 'package:uuid/uuid_value.dart' as _i4;
import 'package:t2_client/src/protocol/category_sync_event.dart' as _i5;
import 'package:t2_client/src/protocol/tag.dart' as _i6;
import 'package:t2_client/src/protocol/tag_sync_event.dart' as _i7;
import 'package:t2_client/src/protocol/task.dart' as _i8;
import 'package:t2_client/src/protocol/task_sync_event.dart' as _i9;
import 'package:t2_client/src/protocol/test_data.dart' as _i10;
import 'package:t2_client/src/protocol/greeting.dart' as _i11;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i12;
import 'protocol.dart' as _i13;

/// {@category Endpoint}
class EndpointCategory extends _i1.EndpointRef {
  EndpointCategory(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'category';

  _i2.Future<_i3.Category> createCategory(_i3.Category category) =>
      caller.callServerEndpoint<_i3.Category>(
        'category',
        'createCategory',
        {'category': category},
      );

  _i2.Future<List<_i3.Category>> getCategories({int? limit}) =>
      caller.callServerEndpoint<List<_i3.Category>>(
        'category',
        'getCategories',
        {'limit': limit},
      );

  _i2.Future<_i3.Category?> getCategoryById(_i4.UuidValue id) =>
      caller.callServerEndpoint<_i3.Category?>(
        'category',
        'getCategoryById',
        {'id': id},
      );

  _i2.Future<List<_i3.Category>> getCategoriesSince(DateTime? since) =>
      caller.callServerEndpoint<List<_i3.Category>>(
        'category',
        'getCategoriesSince',
        {'since': since},
      );

  _i2.Future<bool> updateCategory(_i3.Category category) =>
      caller.callServerEndpoint<bool>(
        'category',
        'updateCategory',
        {'category': category},
      );

  _i2.Future<bool> deleteCategory(_i4.UuidValue id) =>
      caller.callServerEndpoint<bool>(
        'category',
        'deleteCategory',
        {'id': id},
      );

  _i2.Stream<_i5.CategorySyncEvent> watchEvents() =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i5.CategorySyncEvent>,
          _i5.CategorySyncEvent>(
        'category',
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

  _i2.Future<_i6.Tag> createTag(_i6.Tag tag) =>
      caller.callServerEndpoint<_i6.Tag>(
        'tag',
        'createTag',
        {'tag': tag},
      );

  _i2.Future<List<_i6.Tag>> getTags({int? limit}) =>
      caller.callServerEndpoint<List<_i6.Tag>>(
        'tag',
        'getTags',
        {'limit': limit},
      );

  _i2.Future<_i6.Tag?> getTagById(_i4.UuidValue id) =>
      caller.callServerEndpoint<_i6.Tag?>(
        'tag',
        'getTagById',
        {'id': id},
      );

  _i2.Future<List<_i6.Tag>> getTagsSince(DateTime? since) =>
      caller.callServerEndpoint<List<_i6.Tag>>(
        'tag',
        'getTagsSince',
        {'since': since},
      );

  _i2.Future<bool> updateTag(_i6.Tag tag) => caller.callServerEndpoint<bool>(
        'tag',
        'updateTag',
        {'tag': tag},
      );

  _i2.Future<bool> deleteTag(_i4.UuidValue id) =>
      caller.callServerEndpoint<bool>(
        'tag',
        'deleteTag',
        {'id': id},
      );

  _i2.Stream<_i7.TagSyncEvent> watchEvents() =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i7.TagSyncEvent>,
          _i7.TagSyncEvent>(
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

  _i2.Future<_i8.Task> createTask(_i8.Task task) =>
      caller.callServerEndpoint<_i8.Task>(
        'task',
        'createTask',
        {'task': task},
      );

  _i2.Future<List<_i8.Task>> getTasks({int? limit}) =>
      caller.callServerEndpoint<List<_i8.Task>>(
        'task',
        'getTasks',
        {'limit': limit},
      );

  _i2.Future<_i8.Task?> getTaskById(_i4.UuidValue id) =>
      caller.callServerEndpoint<_i8.Task?>(
        'task',
        'getTaskById',
        {'id': id},
      );

  _i2.Future<List<_i8.Task>> getTasksSince(DateTime? since) =>
      caller.callServerEndpoint<List<_i8.Task>>(
        'task',
        'getTasksSince',
        {'since': since},
      );

  _i2.Future<bool> updateTask(_i8.Task task) => caller.callServerEndpoint<bool>(
        'task',
        'updateTask',
        {'task': task},
      );

  _i2.Future<bool> deleteTask(_i4.UuidValue id) =>
      caller.callServerEndpoint<bool>(
        'task',
        'deleteTask',
        {'id': id},
      );

  _i2.Stream<_i9.TaskSyncEvent> watchEvents() =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i9.TaskSyncEvent>,
          _i9.TaskSyncEvent>(
        'task',
        'watchEvents',
        {},
        {},
      );

  _i2.Future<List<_i8.Task>> getTasksByCategoryId(_i4.UuidValue categoryId) =>
      caller.callServerEndpoint<List<_i8.Task>>(
        'task',
        'getTasksByCategoryId',
        {'categoryId': categoryId},
      );
}

/// {@category Endpoint}
class EndpointTestData extends _i1.EndpointRef {
  EndpointTestData(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'testData';

  /// Создает новую запись TestData в базе данных.
  _i2.Future<_i10.TestData> createTestData(_i10.TestData testData) =>
      caller.callServerEndpoint<_i10.TestData>(
        'testData',
        'createTestData',
        {'testData': testData},
      );

  /// Возвращает список всех записей.
  _i2.Future<List<_i10.TestData>> listTestDatas() =>
      caller.callServerEndpoint<List<_i10.TestData>>(
        'testData',
        'listTestDatas',
        {},
      );

  /// Обновляет существующую запись.
  _i2.Future<_i10.TestData> updateTestData(_i10.TestData testData) =>
      caller.callServerEndpoint<_i10.TestData>(
        'testData',
        'updateTestData',
        {'testData': testData},
      );

  /// Удаляет запись.
  _i2.Future<bool> deleteTestData(_i10.TestData testData) =>
      caller.callServerEndpoint<bool>(
        'testData',
        'deleteTestData',
        {'testData': testData},
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
  _i2.Future<_i11.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i11.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i12.Caller(client);
  }

  late final _i12.Caller auth;
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
          _i13.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    category = EndpointCategory(this);
    tag = EndpointTag(this);
    task = EndpointTask(this);
    testData = EndpointTestData(this);
    greeting = EndpointGreeting(this);
    modules = Modules(this);
  }

  late final EndpointCategory category;

  late final EndpointTag tag;

  late final EndpointTask task;

  late final EndpointTestData testData;

  late final EndpointGreeting greeting;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'category': category,
        'tag': tag,
        'task': task,
        'testData': testData,
        'greeting': greeting,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
