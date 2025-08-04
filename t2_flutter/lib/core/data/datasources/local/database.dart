
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:uuid/uuid.dart';
import 'database_types.dart';

// === GENERATED_IMPORTS_START ===
import '../../../../features/home/data/datasources/local/tables/category_table.dart';
import '../../../../features/home/data/datasources/local/tables/tag_table.dart';
import '../../../../features/home/data/datasources/local/tables/task_table.dart';
import '../../../../features/home/data/datasources/local/tables/task_tag_map_table.dart';
import 'tables/sync_metadata_table.dart';
// === GENERATED_IMPORTS_END ===

part 'database.g.dart';

@DriftDatabase(tables: [
// === GENERATED_TABLES_START ===
SyncMetadataTable,
    TagTable,
    CategoryTable,
    TaskTable,
    TaskTagMapTable,
// === GENERATED_TABLES_END ===
])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 4;

@override
MigrationStrategy get migration => MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // === GENERATED_MIGRATION_START ===
        if (from < 4) {
            // Добавление новой таблицы или изменение схемы
        }
        
        // === GENERATED_MIGRATION_END ===
        }        
    );
      
    


  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: '{{targetProject}}_flutter',
    );
  }
}


