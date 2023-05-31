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
      id: fields[0] as int,
      indications: fields[1] as String,
      data: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HealthMonitoringHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.indications)
      ..writeByte(2)
      ..write(obj.data);
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
