
import 'package:app_core/app_core.dart';
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class TagTable extends Table {

    TextColumn get title => text()();
  
  TextColumn get id => text().clientDefault(() => Uuid().v7())();
  IntColumn get userId => integer()();
  TextColumn get customerId => text()();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now().toUtc())();
  IntColumn get lastModified => integer().map(const MillisecondEpochConverter())();
  TextColumn get syncStatus => text().map(const SyncStatusConverter())();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
    
  @override
  Set<Column> get primaryKey => {id};
}
