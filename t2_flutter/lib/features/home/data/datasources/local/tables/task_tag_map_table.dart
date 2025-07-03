
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../../../../../../core/database/local/database_types.dart';
import 'task_table.dart';
import 'tag_table.dart';

class TaskTagMapTable extends Table {

  TextColumn get id => text().clientDefault(() => Uuid().v7())();
  IntColumn get userId => integer()();
  IntColumn get lastModified => integer().map(const MillisecondEpochConverter())();
  TextColumn get syncStatus => text().map(const SyncStatusConverter())();

  TextColumn get taskId => text().references(TaskTable, #id)();
  TextColumn get tagId => text().references(TagTable, #id)();
  
  @override
  List<String> get customConstraints => [
    'UNIQUE(task_id, tag_id, user_id)',
  ];
  
  @override
  Set<Column> get primaryKey => {id};
}
