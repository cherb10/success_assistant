// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_focus.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyFocusAdapter extends TypeAdapter<DailyFocus> {
  @override
  final int typeId = 1;

  @override
  DailyFocus read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyFocus(
      day: fields[0] as String,
      focus: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DailyFocus obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.focus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyFocusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
