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
import '../endpoints/configuration_endpoint.dart' as _i3;
import '../endpoints/tag_endpoint.dart' as _i4;
import '../endpoints/task_endpoint.dart' as _i5;
import '../endpoints/task_tag_map_endpoint.dart' as _i6;
import '../endpoints/test_data_endpoint.dart' as _i7;
import '../endpoints/user_manager_endpoint.dart' as _i8;
import '../greeting_endpoint.dart' as _i9;
import 'package:t2_server/src/generated/category.dart' as _i10;
import 'package:uuid/uuid_value.dart' as _i11;
import 'package:t2_server/src/generated/configuration.dart' as _i12;
import 'package:t2_server/src/generated/tag.dart' as _i13;
import 'package:t2_server/src/generated/task.dart' as _i14;
import 'package:t2_server/src/generated/task_tag_map.dart' as _i15;
import 'package:t2_server/src/generated/test_data.dart' as _i16;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i17;

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
      'configuration': _i3.ConfigurationEndpoint()
        ..initialize(
          server,
          'configuration',
          null,
        ),
      'tag': _i4.TagEndpoint()
        ..initialize(
          server,
          'tag',
          null,
        ),
      'task': _i5.TaskEndpoint()
        ..initialize(
          server,
          'task',
          null,
        ),
      'taskTagMap': _i6.TaskTagMapEndpoint()
        ..initialize(
          server,
          'taskTagMap',
          null,
        ),
      'testData': _i7.TestDataEndpoint()
        ..initialize(
          server,
          'testData',
          null,
        ),
      'userManagement': _i8.UserManagementEndpoint()
        ..initialize(
          server,
          'userManagement',
          null,
        ),
      'greeting': _i9.GreetingEndpoint()
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
              type: _i1.getType<_i10.Category>(),
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
              type: _i1.getType<_i11.UuidValue>(),
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
              type: _i1.getType<_i10.Category>(),
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
    connectors['configuration'] = _i1.EndpointConnector(
      name: 'configuration',
      endpoint: endpoints['configuration']!,
      methodConnectors: {
        'createConfiguration': _i1.MethodConnector(
          name: 'createConfiguration',
          params: {
            'configuration': _i1.ParameterDescription(
              name: 'configuration',
              type: _i1.getType<_i12.Configuration>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['configuration'] as _i3.ConfigurationEndpoint)
                  .createConfiguration(
            session,
            params['configuration'],
          ),
        ),
        'getConfigurations': _i1.MethodConnector(
          name: 'getConfigurations',
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
              (endpoints['configuration'] as _i3.ConfigurationEndpoint)
                  .getConfigurations(
            session,
            limit: params['limit'],
          ),
        ),
        'getConfigurationById': _i1.MethodConnector(
          name: 'getConfigurationById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<_i11.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['configuration'] as _i3.ConfigurationEndpoint)
                  .getConfigurationById(
            session,
            params['id'],
          ),
        ),
        'getConfigurationsSince': _i1.MethodConnector(
          name: 'getConfigurationsSince',
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
              (endpoints['configuration'] as _i3.ConfigurationEndpoint)
                  .getConfigurationsSince(
            session,
            params['since'],
          ),
        ),
        'updateConfiguration': _i1.MethodConnector(
          name: 'updateConfiguration',
          params: {
            'configuration': _i1.ParameterDescription(
              name: 'configuration',
              type: _i1.getType<_i12.Configuration>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['configuration'] as _i3.ConfigurationEndpoint)
                  .updateConfiguration(
            session,
            params['configuration'],
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
              (endpoints['configuration'] as _i3.ConfigurationEndpoint)
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
              type: _i1.getType<_i13.Tag>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tag'] as _i4.TagEndpoint).createTag(
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
              (endpoints['tag'] as _i4.TagEndpoint).getTags(
            session,
            limit: params['limit'],
          ),
        ),
        'getTagById': _i1.MethodConnector(
          name: 'getTagById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<_i11.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tag'] as _i4.TagEndpoint).getTagById(
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
              (endpoints['tag'] as _i4.TagEndpoint).getTagsSince(
            session,
            params['since'],
          ),
        ),
        'updateTag': _i1.MethodConnector(
          name: 'updateTag',
          params: {
            'tag': _i1.ParameterDescription(
              name: 'tag',
              type: _i1.getType<_i13.Tag>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tag'] as _i4.TagEndpoint).updateTag(
            session,
            params['tag'],
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
              (endpoints['tag'] as _i4.TagEndpoint).watchEvents(session),
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
              type: _i1.getType<_i14.Task>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['task'] as _i5.TaskEndpoint).createTask(
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
              (endpoints['task'] as _i5.TaskEndpoint).getTasks(
            session,
            limit: params['limit'],
          ),
        ),
        'getTaskById': _i1.MethodConnector(
          name: 'getTaskById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<_i11.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['task'] as _i5.TaskEndpoint).getTaskById(
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
              (endpoints['task'] as _i5.TaskEndpoint).getTasksSince(
            session,
            params['since'],
          ),
        ),
        'updateTask': _i1.MethodConnector(
          name: 'updateTask',
          params: {
            'task': _i1.ParameterDescription(
              name: 'task',
              type: _i1.getType<_i14.Task>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['task'] as _i5.TaskEndpoint).updateTask(
            session,
            params['task'],
          ),
        ),
        'getTasksByCategoryId': _i1.MethodConnector(
          name: 'getTasksByCategoryId',
          params: {
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<_i11.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['task'] as _i5.TaskEndpoint).getTasksByCategoryId(
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
              (endpoints['task'] as _i5.TaskEndpoint).watchEvents(session),
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
              type: _i1.getType<_i15.TaskTagMap>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['taskTagMap'] as _i6.TaskTagMapEndpoint)
                  .createTaskTagMap(
            session,
            params['taskTagMap'],
          ),
        ),
        'getTagsForTask': _i1.MethodConnector(
          name: 'getTagsForTask',
          params: {
            'taskId': _i1.ParameterDescription(
              name: 'taskId',
              type: _i1.getType<_i11.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['taskTagMap'] as _i6.TaskTagMapEndpoint)
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
              type: _i1.getType<_i11.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['taskTagMap'] as _i6.TaskTagMapEndpoint)
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
              (endpoints['taskTagMap'] as _i6.TaskTagMapEndpoint)
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
              type: _i1.getType<_i11.UuidValue>(),
              nullable: false,
            ),
            'tagId': _i1.ParameterDescription(
              name: 'tagId',
              type: _i1.getType<_i11.UuidValue>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['taskTagMap'] as _i6.TaskTagMapEndpoint)
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
              (endpoints['taskTagMap'] as _i6.TaskTagMapEndpoint)
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
              type: _i1.getType<_i16.TestData>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['testData'] as _i7.TestDataEndpoint).createTestData(
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
              (endpoints['testData'] as _i7.TestDataEndpoint)
                  .listTestDatas(session),
        ),
        'updateTestData': _i1.MethodConnector(
          name: 'updateTestData',
          params: {
            'testData': _i1.ParameterDescription(
              name: 'testData',
              type: _i1.getType<_i16.TestData>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['testData'] as _i7.TestDataEndpoint).updateTestData(
            session,
            params['testData'],
          ),
        ),
        'deleteTestData': _i1.MethodConnector(
          name: 'deleteTestData',
          params: {
            'testData': _i1.ParameterDescription(
              name: 'testData',
              type: _i1.getType<_i16.TestData>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['testData'] as _i7.TestDataEndpoint).deleteTestData(
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
              (endpoints['userManagement'] as _i8.UserManagementEndpoint)
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
              (endpoints['greeting'] as _i9.GreetingEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i17.Endpoints()..initializeEndpoints(server);
  }
}
