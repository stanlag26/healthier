
import 'package:hive/hive.dart';

part 'health_monitoring.g.dart';

@HiveType(typeId: 2)
class HealthMonitoringHive extends HiveObject {
  @HiveField(0)
  final List <String> bodyPressure;

  @HiveField(1)
  final List <String> bodyWeight;

  @HiveField(2)
  final List <String> bodyTemperature;

  @HiveField(3)
  final List <String> bloodSugar;


  HealthMonitoringHive({
    required this.bodyPressure,
    required this.bodyWeight,
    required this.bodyTemperature,
    required this.bloodSugar,
  });
}

//команда для генерации  flutter packages pub run build_runner watch
// flutter packages pub run build_runner build --delete-conflicting-outputs
