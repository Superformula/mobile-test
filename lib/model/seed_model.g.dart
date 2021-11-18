// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seed_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeedAdapter extends TypeAdapter<Seed> {
  @override
  final int typeId = 0;

  @override
  Seed read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Seed(
      seed: fields[0] as String,
      expiresAt: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Seed obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.seed)
      ..writeByte(1)
      ..write(obj.expiresAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
