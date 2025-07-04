/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/category_endpoint.dart' as _i2;
import '../endpoints/tag_endpoint.dart' as _i3;
import '../endpoints/task_endpoint.dart' as _i4;
import '../endpoints/task_tag_map_endpoint.dart' as _i5;
import '../endpoints/test_data_endpoint.dart' as _i6;
import '../endpoints/user_manager_endpoint.dart' as _i7;
import '../greeting_endpoint.dart' as _i8;
import 'package:t2_server/src/generated/category.dart' as _i9;
import 'package:uuid/uuid_value.dart' as _i10;
import 'package:t2_server/src/generated/tag.dart' as _i11;
import 'package:t2_server/src/generated/task.dart' as _i12;
import 'package:t2_server/src/generated/task_tag_map.dart' as _i13;
import 'package:t2_server/src/generated/test_data.dart' as _i14;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i15;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'category': _i2.CategoryEndpoint()
        ..initialize(
          server,
          'category',
          null,
        ),
      'tag': _i3.TagEndpoint()
        ..initialize(
          server,
          'tag',
          null,
        ),
      'task': _i4.TaskEndpoint()
        ..initialize(
          server,
          'task',
          null,
        ),
      'taskTagMap': _i5.TaskTagMapEndpoint()
        ..initialize(
          server,
          'taskTagMap',
          null,
        ),
      'testData': _i6.TestDataEndpoint()
        ..initialize(
          server,
          'testData',
          null,
        ),
      'userManagement': _i7.UserManagementEndpoint()
        ..initialize(
          server,
          'userManagement',
          null,
        ),
      'greeting': _i8.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['category'] = _i1.EndpointConnector(
      name: 'category',
      endpoint: endpoints['category']!,
      methodConnectors: {
        'createCategory': _i1.MethodConnector(
          name: 'createCategory',
          params: {
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<_i9.Category>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint).createCategory(
            session,
            params['category'],
          ),
        ),
        'getCategories': _i1.MethodConnector(
          name: 'getCategories',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint).getCategories(
            session,
            limit: params['limit'],
          ),
        ),
        'getCategoryById': _i1.MethodConnector(
          name: 'getCategoryById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<_i10.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint).getCategoryById(
            session,
            params['id'],
          ),
        ),
        'getCategoriesSince': _i1.MethodConnector(
          name: 'getCategoriesSince',
          params: {
            'since': _i1.ParameterDescription(
              name: 'since',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint)
                  .getCategoriesSince(
            session,
            params['since'],
          ),
        ),
        'updateCategory': _i1.MethodConnector(
          name: 'updateCategory',
          params: {
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<_i9.Category>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint).updateCategory(
            session,
            params['category'],
          ),
        ),
        'deleteCategory': _i1.MethodConnector(
          name: 'deleteCategory',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<_i10.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint).deleteCategory(
            session,
            params['id'],
          ),
        ),
        'watchEvents': _i1.MethodStreamConnector(
          name: 'watchEvents',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['category'] as _i2.CategoryEndpoint)
                  .watchEvents(session),
        ),
      },
    );
    connectors['tag'] = _i1.EndpointConnector(
      name: 'tag',
      endpoint: endpoints['tag']!,
      methodConnectors: {
        'createTag': _i1.MethodConnector(
          name: 'createTag',
          params: {
            'tag': _i1.ParameterDescription(
              name: 'tag',
              type: _i1.getType<_i11.Tag>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tag'] as _i3.TagEndpoint).createTag(
            session,
            params['tag'],
          ),
        ),
        'getTags': _i1.MethodConnector(
          name: 'getTags',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tag'] as _i3.TagEndpoint).getTags(
            session,
            limit: params['limit'],
          ),
        ),
        'getTagById': _i1.MethodConnector(
          name: 'getTagById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<_i10.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tag'] as _i3.TagEndpoint).getTagById(
            session,
            params['id'],
          ),
        ),
        'getTagsSince': _i1.MethodConnector(
          name: 'getTagsSince',
          params: {
            'since': _i1.ParameterDescription(
              name: 'since',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tag'] as _i3.TagEndpoint).getTagsSince(
            session,
            params['since'],
          ),
        ),
        'updateTag': _i1.MethodConnector(
          name: 'updateTag',
          params: {
            'tag': _i1.ParameterDescription(
              name: 'tag',
              type: _i1.getType<_i11.Tag>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tag'] as _i3.TagEndpoint).updateTag(
            session,
            params['tag'],
          ),
        ),
        'deleteTag': _i1.MethodConnector(
          name: 'deleteTag',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<_i10.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tag'] as _i3.TagEndpoint).deleteTag(
            session,
            params['id'],
          ),
        ),
        'watchEvents': _i1.MethodStreamConnector(
          name: 'watchEvents',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['tag'] as _i3.TagEndpoint).watchEvents(session),
        ),
      },
    );
    connectors['task'] = _i1.EndpointConnector(
      name: 'task',
      endpoint: endpoints['task']!,
      methodConnectors: {
        'createTask': _i1.MethodConnector(
          name: 'createTask',
          params: {
            'task': _i1.ParameterDescription(
              name: 'task',
              type: _i1.getType<_i12.Task>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['task'] as _i4.TaskEndpoint).createTask(
            session,
            params['task'],
          ),
        ),
        'getTasks': _i1.MethodConnector(
          name: 'getTasks',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['task'] as _i4.TaskEndpoint).getTasks(
            session,
            limit: params['limit'],
          ),
        ),
        'getTaskById': _i1.MethodConnector(
          name: 'getTaskById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<_i10.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['task'] as _i4.TaskEndpoint).getTaskById(
            session,
            params['id'],
          ),
        ),
        'getTasksSince': _i1.MethodConnector(
          name: 'getTasksSince',
          params: {
            'since': _i1.ParameterDescription(
              name: 'since',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['task'] as _i4.TaskEndpoint).getTasksSince(
            session,
            params['since'],
          ),
        ),
        'updateTask': _i1.MethodConnector(
          name: 'updateTask',
          params: {
            'task': _i1.ParameterDescription(
              name: 'task',
              type: _i1.getType<_i12.Task>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['task'] as _i4.TaskEndpoint).updateTask(
            session,
            params['task'],
          ),
        ),
        'deleteTask': _i1.MethodConnector(
          name: 'deleteTask',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<_i10.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['task'] as _i4.TaskEndpoint).deleteTask(
            session,
            params['id'],
          ),
        ),
        'getTasksByCategoryId': _i1.MethodConnector(
          name: 'getTasksByCategoryId',
          params: {
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<_i10.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['task'] as _i4.TaskEndpoint).getTasksByCategoryId(
            session,
            params['categoryId'],
          ),
        ),
        'watchEvents': _i1.MethodStreamConnector(
          name: 'watchEvents',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['task'] as _i4.TaskEndpoint).watchEvents(session),
        ),
      },
    );
    connectors['taskTagMap'] = _i1.EndpointConnector(
      name: 'taskTagMap',
      endpoint: endpoints['taskTagMap']!,
      methodConnectors: {
        'createTaskTagMap': _i1.MethodConnector(
          name: 'createTaskTagMap',
          params: {
            'taskTagMap': _i1.ParameterDescription(
              name: 'taskTagMap',
              type: _i1.getType<_i13.TaskTagMap>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['taskTagMap'] as _i5.TaskTagMapEndpoint)
                  .createTaskTagMap(
            session,
            params['taskTagMap'],
          ),
        ),
        'deleteTaskTagMapById': _i1.MethodConnector(
          name: 'deleteTaskTagMapById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<_i10.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['taskTagMap'] as _i5.TaskTagMapEndpoint)
                  .deleteTaskTagMapById(
            session,
            params['id'],
          ),
        ),
        'getTagsForTask': _i1.MethodConnector(
          name: 'getTagsForTask',
          params: {
            'taskId': _i1.ParameterDescription(
              name: 'taskId',
              type: _i1.getType<_i10.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['taskTagMap'] as _i5.TaskTagMapEndpoint)
                  .getTagsForTask(
            session,
            params['taskId'],
          ),
        ),
        'getTasksForTag': _i1.MethodConnector(
          name: 'getTasksForTag',
          params: {
            'tagId': _i1.ParameterDescription(
              name: 'tagId',
              type: _i1.getType<_i10.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['taskTagMap'] as _i5.TaskTagMapEndpoint)
                  .getTasksForTag(
            session,
            params['tagId'],
          ),
        ),
        'getTaskTagMapsSince': _i1.MethodConnector(
          name: 'getTaskTagMapsSince',
          params: {
            'since': _i1.ParameterDescription(
              name: 'since',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['taskTagMap'] as _i5.TaskTagMapEndpoint)
                  .getTaskTagMapsSince(
            session,
            params['since'],
          ),
        ),
        'deleteTaskTagMapByTaskAndTag': _i1.MethodConnector(
          name: 'deleteTaskTagMapByTaskAndTag',
          params: {
            'taskId': _i1.ParameterDescription(
              name: 'taskId',
              type: _i1.getType<_i10.UuidValue>(),
              nullable: false,
            ),
            'tagId': _i1.ParameterDescription(
              name: 'tagId',
              type: _i1.getType<_i10.UuidValue>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['taskTagMap'] as _i5.TaskTagMapEndpoint)
                  .deleteTaskTagMapByTaskAndTag(
            session,
            params['taskId'],
            params['tagId'],
          ),
        ),
        'watchEvents': _i1.MethodStreamConnector(
          name: 'watchEvents',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['taskTagMap'] as _i5.TaskTagMapEndpoint)
                  .watchEvents(session),
        ),
      },
    );
    connectors['testData'] = _i1.EndpointConnector(
      name: 'testData',
      endpoint: endpoints['testData']!,
      methodConnectors: {
        'createTestData': _i1.MethodConnector(
          name: 'createTestData',
          params: {
            'testData': _i1.ParameterDescription(
              name: 'testData',
              type: _i1.getType<_i14.TestData>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['testData'] as _i6.TestDataEndpoint).createTestData(
            session,
            params['testData'],
          ),
        ),
        'listTestDatas': _i1.MethodConnector(
          name: 'listTestDatas',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['testData'] as _i6.TestDataEndpoint)
                  .listTestDatas(session),
        ),
        'updateTestData': _i1.MethodConnector(
          name: 'updateTestData',
          params: {
            'testData': _i1.ParameterDescription(
              name: 'testData',
              type: _i1.getType<_i14.TestData>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['testData'] as _i6.TestDataEndpoint).updateTestData(
            session,
            params['testData'],
          ),
        ),
        'deleteTestData': _i1.MethodConnector(
          name: 'deleteTestData',
          params: {
            'testData': _i1.ParameterDescription(
              name: 'testData',
              type: _i1.getType<_i14.TestData>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['testData'] as _i6.TestDataEndpoint).deleteTestData(
            session,
            params['testData'],
          ),
        ),
      },
    );
    connectors['userManagement'] = _i1.EndpointConnector(
      name: 'userManagement',
      endpoint: endpoints['userManagement']!,
      methodConnectors: {
        'getMyUserContext': _i1.MethodConnector(
          name: 'getMyUserContext',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userManagement'] as _i7.UserManagementEndpoint)
                  .getMyUserContext(session),
        )
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['greeting'] as _i8.GreetingEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i15.Endpoints()..initializeEndpoints(server);
  }
}
