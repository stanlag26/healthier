import 'package:hive/hive.dart';

part 'health_monitoring.g.dart';

@HiveType(typeId: 2)
class HealthMonitoringHive extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String indications;

  @HiveField(2)
  final DateTime data;

  HealthMonitoringHive( {
    required this.id,
    required this.indications,
    required this.data,
  });
}

//команда для генерации  flutter packages pub run build_runner watch
// flutter packages pub run build_runner build --delete-conflicting-outputs
