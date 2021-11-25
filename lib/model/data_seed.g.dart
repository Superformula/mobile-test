// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_seed.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataSeedAdapter extends TypeAdapter<DataSeed> {
  @override
  final int typeId = 0;

  @override
  DataSeed read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataSeed(
      data: fields[0] as String,
      expiresAt: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DataSeed obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.data)
      ..writeByte(1)
      ..write(obj.expiresAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataSeedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
