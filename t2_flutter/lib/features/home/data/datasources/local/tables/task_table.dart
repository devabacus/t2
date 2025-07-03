
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../../../../../../core/database/local/database_types.dart';
import 'category_table.dart';

class TaskTable extends Table {

  // Статичные поля для всех моделей
  TextColumn get id => text().clientDefault(() => Uuid().v7())();
  IntColumn get userId => integer()();
  IntColumn get lastModified => integer().map(const MillisecondEpochConverter())();
  TextColumn get syncStatus => text().map(const SyncStatusConverter())();
  
  // Поля модели
    TextColumn get title => text()();
  TextColumn get categoryId => text().nullable().references(CategoryTable, #id, onDelete: KeyAction.setNull)();
  TextColumn get category => text().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}
