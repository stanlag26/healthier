// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_monitoring.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HealthMonitoringHiveAdapter extends TypeAdapter<HealthMonitoringHive> {
  @override
  final int typeId = 2;

  @override
  HealthMonitoringHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HealthMonitoringHive(
      bodyPressure: (fields[0] as List).cast<String>(),
      bodyWeight: (fields[1] as List).cast<String>(),
      bodyTemperature: (fields[2] as List).cast<String>(),
      bloodSugar: (fields[3] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, HealthMonitoringHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.bodyPressure)
      ..writeByte(1)
      ..write(obj.bodyWeight)
      ..writeByte(2)
      ..write(obj.bodyTemperature)
      ..writeByte(3)
      ..write(obj.bloodSugar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HealthMonitoringHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
