// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seed_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SeedDto _$_$_SeedDtoFromJson(Map<String, dynamic> json) {
  return _$_SeedDto(
    seed: json['seed'] as String,
    expiresAt: json['expires_at'] as String,
  );
}

Map<String, dynamic> _$_$_SeedDtoToJson(_$_SeedDto instance) =>
    <String, dynamic>{
      'seed': instance.seed,
      'expires_at': instance.expiresAt,
    };
