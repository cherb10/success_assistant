// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_checkin_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeeklyCheckInModelAdapter extends TypeAdapter<WeeklyCheckInModel> {
  @override
  final int typeId = 0;

  @override
  WeeklyCheckInModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeeklyCheckInModel(
      reflection: fields[0] as String,
      theme: fields[1] as String,
      focusScore: fields[2] as double,
      intentions: fields[3] as String,
      createdAt: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, WeeklyCheckInModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.reflection)
      ..writeByte(1)
      ..write(obj.theme)
      ..writeByte(2)
      ..write(obj.focusScore)
      ..writeByte(3)
      ..write(obj.intentions)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeeklyCheckInModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
