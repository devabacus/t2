// lib/core/data/datasources/remote/serverpod_configuration_data_source.dart

import 'package:t2/features/configuration/domain/datasources/i_configuration_remote_data_source.dart';
import 'package:t2/features/configuration/domain/entities/configuration/configuration_entity.dart';
import 'package:t2_client/t2_client.dart' as serverpod;

class ServerpodConfigurationDataSource implements IConfigurationRemoteDataSource {
  final serverpod.Client _client;

  ServerpodConfigurationDataSource(this._client);

 // --- ЛОГИКА КОНВЕРТАЦИИ ИЗ SERVERPOD В ENTITY ---
  ConfigurationEntity _fromServerpod(serverpod.Configuration config) {
    return ConfigurationEntity(
      id: config.id.toString(),
      userId: config.userId,
      customerId: config.customerId.toString(),
      createdAt: config.createdAt,
      lastModified: config.lastModified,
      isDeleted: config.isDeleted,
      group: config.group,
      key: config.key,
      value: config.value,
    );
  }

  // --- ЛОГИКА КОНВЕРТАЦИИ ИЗ ENTITY В SERVERPOD ---
  serverpod.Configuration _toServerpod(ConfigurationEntity entity) {
    return serverpod.Configuration(
      id: serverpod.UuidValue.fromString(entity.id),
      userId: entity.userId,
      customerId: serverpod.UuidValue.fromString(entity.customerId),
      createdAt: entity.createdAt,
      lastModified: entity.lastModified,
      isDeleted: entity.isDeleted,
      group: entity.group,
      key: entity.key,
      value: entity.value,
    );
  }


 @override
  Future<List<ConfigurationEntity>> getConfigurationsSince(DateTime? since) async {
    final serverpodConfigs = await _client.configuration.getConfigurationsSince(since);
    return serverpodConfigs.map(_fromServerpod).toList();
  }

  @override
  Future<ConfigurationEntity> createConfiguration(ConfigurationEntity configuration) async {
    final result = await _client.configuration.createConfiguration(_toServerpod(configuration));
    return _fromServerpod(result);
  }

  @override
  Future<void> updateConfiguration(ConfigurationEntity configuration) async {
    await _client.configuration.updateConfiguration(_toServerpod(configuration));
  }

  @override
  Stream<dynamic> watchEvents() {
    return _client.configuration.watchEvents().map((event) {
      if (event.configuration != null) {
        return _fromServerpod(event.configuration!);
      }
      return null;
    }).where((event) => event != null);
  }
}
