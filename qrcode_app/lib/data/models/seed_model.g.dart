// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeedDto _$SeedDtoFromJson(Map<String, dynamic> json) {
  return SeedDto(
    duration: json['duration'] as int?,
    seed: json['seed'] as String?,
    expiration: json['expiration'] == null
        ? null
        : DateTime.parse(json['expiration'] as String),
  );
}

Map<String, dynamic> _$SeedDtoToJson(SeedDto instance) => <String, dynamic>{
      'seed': instance.seed,
      'expiration': instance.expiration?.toIso8601String(),
      'duration': instance.duration,
    };
