// manifest: startProject
import '../../../../../../../core/data/datasources/local/database.dart';
import '../../../../models/configuration/configuration_model.dart';

extension ConfigurationTableDataExtensions on ConfigurationTableData {
  ConfigurationModel toModel() => ConfigurationModel(
    id: id,
    userId: userId,
    customerId: customerId,
    createdAt: createdAt,
    lastModified: lastModified,
    isDeleted: isDeleted,

// === generated_start:simpleFields ===
  group: group,
  key: key,
  value: value
// === generated_end:simpleFields ===
  );
}

extension ConfigurationTableDataListExtensions on List<ConfigurationTableData> {
  List<ConfigurationModel> toModels() => map((data) => data.toModel()).toList();
}

