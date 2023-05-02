// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseHiveAdapter extends TypeAdapter<CourseHive> {
  @override
  final int typeId = 1;

  @override
  CourseHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourseHive(
      namePill: fields[0] as String,
      descriptionPill: fields[1] as String,
      photoPill: fields[2] as String?,
      timeOfReceipt: (fields[6] as List).cast<String>(),
      startNamePill: fields[3] as DateTime?,
      endNamePill: fields[4] as DateTime?,
      periodicity: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CourseHive obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.namePill)
      ..writeByte(1)
      ..write(obj.descriptionPill)
      ..writeByte(2)
      ..write(obj.photoPill)
      ..writeByte(3)
      ..write(obj.startNamePill)
      ..writeByte(4)
      ..write(obj.endNamePill)
      ..writeByte(5)
      ..write(obj.periodicity)
      ..writeByte(6)
      ..write(obj.timeOfReceipt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
