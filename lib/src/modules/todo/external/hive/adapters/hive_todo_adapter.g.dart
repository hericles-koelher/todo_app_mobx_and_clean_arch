// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_todo_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveTodoAdapterAdapter extends TypeAdapter<HiveTodoAdapter> {
  @override
  final int typeId = 0;

  @override
  HiveTodoAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveTodoAdapter(
      id: fields[0] as String,
      label: fields[1] as String,
      status: fields[3] as bool,
      description: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveTodoAdapter obj) {
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
      other is HiveTodoAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
