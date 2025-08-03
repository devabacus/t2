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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'greeting.dart' as _i4;
import 'category.dart' as _i5;
import 'category_sync_event.dart' as _i6;
import 'configuration.dart' as _i7;
import 'configuration_sync_event.dart' as _i8;
import 'sync_event_type.dart' as _i9;
import 'tag.dart' as _i10;
import 'tag_sync_event.dart' as _i11;
import 'task.dart' as _i12;
import 'task_sync_event.dart' as _i13;
import 'task_tag_map.dart' as _i14;
import 'task_tag_map_sync_event.dart' as _i15;
import 'test_data.dart' as _i16;
import 'user/customer.dart' as _i17;
import 'user/customer_user.dart' as _i18;
import 'user/permission.dart' as _i19;
import 'user/role.dart' as _i20;
import 'user/role_permission.dart' as _i21;
import 'user/user_session_data.dart' as _i22;
import 'package:t2_server/src/generated/category.dart' as _i23;
import 'package:t2_server/src/generated/configuration.dart' as _i24;
import 'package:t2_server/src/generated/tag.dart' as _i25;
import 'package:t2_server/src/generated/task.dart' as _i26;
import 'package:t2_server/src/generated/task_tag_map.dart' as _i27;
import 'package:t2_server/src/generated/test_data.dart' as _i28;
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
export 'user/user_session_data.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'category',
      dartName: 'Category',
      schema: 'public',
      module: 't2',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'lastModified',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'isDeleted',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'category_fk_0',
          columns: ['customerId'],
          referenceTable: 'customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'category_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'configuration',
      dartName: 'Configuration',
      schema: 'public',
      module: 't2',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'lastModified',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'isDeleted',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'group',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'key',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'value',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'configuration_fk_0',
          columns: ['customerId'],
          referenceTable: 'customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'configuration_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'customer',
      dartName: 'Customer',
      schema: 'public',
      module: 't2',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'lastModified',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'isDeleted',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'info',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'subscriptionStatus',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'customer_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'customer_user',
      dartName: 'CustomerUser',
      schema: 'public',
      module: 't2',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'roleId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'customer_user_fk_0',
          columns: ['customerId'],
          referenceTable: 'customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'customer_user_fk_1',
          columns: ['roleId'],
          referenceTable: 'role',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'customer_user_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'permission',
      dartName: 'Permission',
      schema: 'public',
      module: 't2',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'key',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'permission_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'role',
      dartName: 'Role',
      schema: 'public',
      module: 't2',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'role_fk_0',
          columns: ['customerId'],
          referenceTable: 'customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'role_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'role_permission',
      dartName: 'RolePermission',
      schema: 'public',
      module: 't2',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'roleId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'permissionId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'role_permission_fk_0',
          columns: ['roleId'],
          referenceTable: 'role',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'role_permission_fk_1',
          columns: ['permissionId'],
          referenceTable: 'permission',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'role_permission_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'tag',
      dartName: 'Tag',
      schema: 'public',
      module: 't2',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'lastModified',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'isDeleted',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'tag_fk_0',
          columns: ['customerId'],
          referenceTable: 'customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'tag_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'task',
      dartName: 'Task',
      schema: 'public',
      module: 't2',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'lastModified',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'isDeleted',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'categoryId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _i2.ColumnDefinition(
          name: 'category',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'protocol:Category?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'task_fk_0',
          columns: ['customerId'],
          referenceTable: 'customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'task_fk_1',
          columns: ['categoryId'],
          referenceTable: 'category',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'task_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'task_tag_map',
      dartName: 'TaskTagMap',
      schema: 'public',
      module: 't2',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'taskId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'tagId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'lastModified',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'isDeleted',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: '_tagTasktagmapsTagId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _i2.ColumnDefinition(
          name: '_taskTasktagmapsTaskId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'task_tag_map_fk_0',
          columns: ['taskId'],
          referenceTable: 'task',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'task_tag_map_fk_1',
          columns: ['tagId'],
          referenceTable: 'tag',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'task_tag_map_fk_2',
          columns: ['customerId'],
          referenceTable: 'customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'task_tag_map_fk_3',
          columns: ['_tagTasktagmapsTagId'],
          referenceTable: 'tag',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'task_tag_map_fk_4',
          columns: ['_taskTasktagmapsTaskId'],
          referenceTable: 'task',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'task_tag_map_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'task_tag_map_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'taskId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'tagId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'test_data',
      dartName: 'TestData',
      schema: 'public',
      module: 't2',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'test_data_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.Greeting) {
      return _i4.Greeting.fromJson(data) as T;
    }
    if (t == _i5.Category) {
      return _i5.Category.fromJson(data) as T;
    }
    if (t == _i6.CategorySyncEvent) {
      return _i6.CategorySyncEvent.fromJson(data) as T;
    }
    if (t == _i7.Configuration) {
      return _i7.Configuration.fromJson(data) as T;
    }
    if (t == _i8.ConfigurationSyncEvent) {
      return _i8.ConfigurationSyncEvent.fromJson(data) as T;
    }
    if (t == _i9.SyncEventType) {
      return _i9.SyncEventType.fromJson(data) as T;
    }
    if (t == _i10.Tag) {
      return _i10.Tag.fromJson(data) as T;
    }
    if (t == _i11.TagSyncEvent) {
      return _i11.TagSyncEvent.fromJson(data) as T;
    }
    if (t == _i12.Task) {
      return _i12.Task.fromJson(data) as T;
    }
    if (t == _i13.TaskSyncEvent) {
      return _i13.TaskSyncEvent.fromJson(data) as T;
    }
    if (t == _i14.TaskTagMap) {
      return _i14.TaskTagMap.fromJson(data) as T;
    }
    if (t == _i15.TaskTagMapSyncEvent) {
      return _i15.TaskTagMapSyncEvent.fromJson(data) as T;
    }
    if (t == _i16.TestData) {
      return _i16.TestData.fromJson(data) as T;
    }
    if (t == _i17.Customer) {
      return _i17.Customer.fromJson(data) as T;
    }
    if (t == _i18.CustomerUser) {
      return _i18.CustomerUser.fromJson(data) as T;
    }
    if (t == _i19.Permission) {
      return _i19.Permission.fromJson(data) as T;
    }
    if (t == _i20.Role) {
      return _i20.Role.fromJson(data) as T;
    }
    if (t == _i21.RolePermission) {
      return _i21.RolePermission.fromJson(data) as T;
    }
    if (t == _i22.UserSessionData) {
      return _i22.UserSessionData.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.Greeting?>()) {
      return (data != null ? _i4.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Category?>()) {
      return (data != null ? _i5.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.CategorySyncEvent?>()) {
      return (data != null ? _i6.CategorySyncEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Configuration?>()) {
      return (data != null ? _i7.Configuration.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.ConfigurationSyncEvent?>()) {
      return (data != null ? _i8.ConfigurationSyncEvent.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i9.SyncEventType?>()) {
      return (data != null ? _i9.SyncEventType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Tag?>()) {
      return (data != null ? _i10.Tag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.TagSyncEvent?>()) {
      return (data != null ? _i11.TagSyncEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Task?>()) {
      return (data != null ? _i12.Task.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.TaskSyncEvent?>()) {
      return (data != null ? _i13.TaskSyncEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.TaskTagMap?>()) {
      return (data != null ? _i14.TaskTagMap.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.TaskTagMapSyncEvent?>()) {
      return (data != null ? _i15.TaskTagMapSyncEvent.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i16.TestData?>()) {
      return (data != null ? _i16.TestData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.Customer?>()) {
      return (data != null ? _i17.Customer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.CustomerUser?>()) {
      return (data != null ? _i18.CustomerUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.Permission?>()) {
      return (data != null ? _i19.Permission.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.Role?>()) {
      return (data != null ? _i20.Role.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.RolePermission?>()) {
      return (data != null ? _i21.RolePermission.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.UserSessionData?>()) {
      return (data != null ? _i22.UserSessionData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i14.TaskTagMap>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i14.TaskTagMap>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i14.TaskTagMap>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i14.TaskTagMap>(e)).toList()
          : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i23.Category>) {
      return (data as List).map((e) => deserialize<_i23.Category>(e)).toList()
          as T;
    }
    if (t == List<_i24.Configuration>) {
      return (data as List)
          .map((e) => deserialize<_i24.Configuration>(e))
          .toList() as T;
    }
    if (t == List<_i25.Tag>) {
      return (data as List).map((e) => deserialize<_i25.Tag>(e)).toList() as T;
    }
    if (t == List<_i26.Task>) {
      return (data as List).map((e) => deserialize<_i26.Task>(e)).toList() as T;
    }
    if (t == List<_i27.TaskTagMap>) {
      return (data as List).map((e) => deserialize<_i27.TaskTagMap>(e)).toList()
          as T;
    }
    if (t == List<_i28.TestData>) {
      return (data as List).map((e) => deserialize<_i28.TestData>(e)).toList()
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i4.Greeting) {
      return 'Greeting';
    }
    if (data is _i5.Category) {
      return 'Category';
    }
    if (data is _i6.CategorySyncEvent) {
      return 'CategorySyncEvent';
    }
    if (data is _i7.Configuration) {
      return 'Configuration';
    }
    if (data is _i8.ConfigurationSyncEvent) {
      return 'ConfigurationSyncEvent';
    }
    if (data is _i9.SyncEventType) {
      return 'SyncEventType';
    }
    if (data is _i10.Tag) {
      return 'Tag';
    }
    if (data is _i11.TagSyncEvent) {
      return 'TagSyncEvent';
    }
    if (data is _i12.Task) {
      return 'Task';
    }
    if (data is _i13.TaskSyncEvent) {
      return 'TaskSyncEvent';
    }
    if (data is _i14.TaskTagMap) {
      return 'TaskTagMap';
    }
    if (data is _i15.TaskTagMapSyncEvent) {
      return 'TaskTagMapSyncEvent';
    }
    if (data is _i16.TestData) {
      return 'TestData';
    }
    if (data is _i17.Customer) {
      return 'Customer';
    }
    if (data is _i18.CustomerUser) {
      return 'CustomerUser';
    }
    if (data is _i19.Permission) {
      return 'Permission';
    }
    if (data is _i20.Role) {
      return 'Role';
    }
    if (data is _i21.RolePermission) {
      return 'RolePermission';
    }
    if (data is _i22.UserSessionData) {
      return 'UserSessionData';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
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
      return deserialize<_i4.Greeting>(data['data']);
    }
    if (dataClassName == 'Category') {
      return deserialize<_i5.Category>(data['data']);
    }
    if (dataClassName == 'CategorySyncEvent') {
      return deserialize<_i6.CategorySyncEvent>(data['data']);
    }
    if (dataClassName == 'Configuration') {
      return deserialize<_i7.Configuration>(data['data']);
    }
    if (dataClassName == 'ConfigurationSyncEvent') {
      return deserialize<_i8.ConfigurationSyncEvent>(data['data']);
    }
    if (dataClassName == 'SyncEventType') {
      return deserialize<_i9.SyncEventType>(data['data']);
    }
    if (dataClassName == 'Tag') {
      return deserialize<_i10.Tag>(data['data']);
    }
    if (dataClassName == 'TagSyncEvent') {
      return deserialize<_i11.TagSyncEvent>(data['data']);
    }
    if (dataClassName == 'Task') {
      return deserialize<_i12.Task>(data['data']);
    }
    if (dataClassName == 'TaskSyncEvent') {
      return deserialize<_i13.TaskSyncEvent>(data['data']);
    }
    if (dataClassName == 'TaskTagMap') {
      return deserialize<_i14.TaskTagMap>(data['data']);
    }
    if (dataClassName == 'TaskTagMapSyncEvent') {
      return deserialize<_i15.TaskTagMapSyncEvent>(data['data']);
    }
    if (dataClassName == 'TestData') {
      return deserialize<_i16.TestData>(data['data']);
    }
    if (dataClassName == 'Customer') {
      return deserialize<_i17.Customer>(data['data']);
    }
    if (dataClassName == 'CustomerUser') {
      return deserialize<_i18.CustomerUser>(data['data']);
    }
    if (dataClassName == 'Permission') {
      return deserialize<_i19.Permission>(data['data']);
    }
    if (dataClassName == 'Role') {
      return deserialize<_i20.Role>(data['data']);
    }
    if (dataClassName == 'RolePermission') {
      return deserialize<_i21.RolePermission>(data['data']);
    }
    if (dataClassName == 'UserSessionData') {
      return deserialize<_i22.UserSessionData>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i5.Category:
        return _i5.Category.t;
      case _i7.Configuration:
        return _i7.Configuration.t;
      case _i10.Tag:
        return _i10.Tag.t;
      case _i12.Task:
        return _i12.Task.t;
      case _i14.TaskTagMap:
        return _i14.TaskTagMap.t;
      case _i16.TestData:
        return _i16.TestData.t;
      case _i17.Customer:
        return _i17.Customer.t;
      case _i18.CustomerUser:
        return _i18.CustomerUser.t;
      case _i19.Permission:
        return _i19.Permission.t;
      case _i20.Role:
        return _i20.Role.t;
      case _i21.RolePermission:
        return _i21.RolePermission.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 't2';
}
