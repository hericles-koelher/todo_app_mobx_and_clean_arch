// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_todo_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveTodoObjectAdapter extends TypeAdapter<HiveTodoObject> {
  @override
  final int typeId = 0;

  @override
  HiveTodoObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveTodoObject(
      id: fields[0] as String,
      label: fields[1] as String,
      description: fields[2] as String?,
      status: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HiveTodoObject obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.label)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveTodoObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
