import '../../../features/home/data/datasources/local/tables/task_tag_map_table.dart';
import '../../../features/home/data/datasources/local/tables/task_tag_map_table.dart';
import '../../../features/home/data/datasources/local/tables/task_tag_map_table.dart';
import '../../../features/home/data/datasources/local/tables/task_tag_map_table.dart';
import '../../../features/home/data/datasources/local/tables/task_table.dart';
import '../../../features/home/data/datasources/local/tables/task_table.dart';
import '../../../features/home/data/datasources/local/tables/category_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/task_tag_map_table.dart';
import '../../../features/home/data/datasources/local/tables/task_tag_map_table.dart';
import '../../../features/home/data/datasources/local/tables/task_table.dart';
import '../../../features/home/data/datasources/local/tables/category_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/task_tag_map_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/task_tag_map_table.dart';
import '../../../features/home/data/datasources/local/tables/task_tag_map_table.dart';
import '../../../features/home/data/datasources/local/tables/task_tag_map_table.dart';
import '../../../features/home/data/datasources/local/tables/task_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/task_tag_map_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/task_tag_map_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/task_tag_map_table.dart';
import '../../../features/home/data/datasources/local/tables/task_tag_map_table.dart';
import '../../../features/home/data/datasources/local/tables/task_tag_map_table.dart';
import '../../../features/home/data/datasources/local/tables/task_tag_map_table.dart';
import '../../../features/home/data/datasources/local/tables/task_tag_map_table.dart';
import '../../../features/home/data/datasources/local/tables/task_table.dart';
import '../../../features/home/data/datasources/local/tables/task_table.dart';
import '../../../features/home/data/datasources/local/tables/category_table.dart';
import '../../../features/home/data/datasources/local/tables/category_table.dart';
import '../../../features/home/data/datasources/local/tables/category_table.dart';
import '../../../features/home/data/datasources/local/tables/category_table.dart';
import '../../../features/home/data/datasources/local/tables/category_table.dart';
import '../../../features/home/data/datasources/local/tables/category_table.dart';
import '../../../features/home/data/datasources/local/tables/category_table.dart';
import '../../../features/home/data/datasources/local/tables/category_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/task_tag_map_table.dart';
import '../../../features/home/data/datasources/local/tables/task_table.dart';
import '../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../features/home/data/datasources/local/tables/category_table.dart';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:uuid/uuid.dart';

import 'database_types.dart';
import 'tables/sync_metadata_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [SyncMetadata, CategoryTable, TagTable, TaskTable, TaskTagMapTable, TagTable, TagTable, TagTable, TagTable, TagTable, TagTable, TagTable, TagTable, TagTable, TagTable, TagTable, TagTable, TagTable, TagTable, TagTable, TagTable, TagTable, TagTable, TagTable, TagTable, CategoryTable, CategoryTable, CategoryTable, CategoryTable, CategoryTable, CategoryTable, CategoryTable, CategoryTable, TaskTable, TaskTable, TaskTagMapTable, TaskTagMapTable, TaskTagMapTable, TaskTagMapTable, TaskTagMapTable, TagTable, TagTable, TaskTagMapTable, TagTable, TagTable, TaskTagMapTable, TagTable, TaskTable, TaskTagMapTable, TaskTagMapTable, TaskTagMapTable, TagTable, TaskTagMapTable, TagTable, TagTable, CategoryTable, TaskTable, TaskTagMapTable, TaskTagMapTable, TagTable, TagTable, CategoryTable, TaskTable, TaskTable, TaskTagMapTable, TaskTagMapTable, TaskTagMapTable, TaskTagMapTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

@override
MigrationStrategy get migration => MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
            
        if (from < 2) {

        }        
        
      },
    );


  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 't2_flutter',
    );
  }
}

