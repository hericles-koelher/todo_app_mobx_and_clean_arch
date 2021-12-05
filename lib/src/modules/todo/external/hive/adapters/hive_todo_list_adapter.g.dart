// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_todo_list_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveTodoListAdapterAdapter extends TypeAdapter<HiveTodoListAdapter> {
  @override
  final int typeId = 1;

  @override
  HiveTodoListAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveTodoListAdapter(
      (fields[0] as List).cast<HiveTodoAdapter>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveTodoListAdapter obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.adaptersList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveTodoListAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
