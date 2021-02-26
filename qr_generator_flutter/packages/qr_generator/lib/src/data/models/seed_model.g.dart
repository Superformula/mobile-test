// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeedModel _$SeedModelFromJson(Map<String, dynamic> json) {
  return SeedModel(
    seed: json['seed'] as String,
    expiresAt: json['expires_at'] == null
        ? null
        : DateTime.parse(json['expires_at'] as String),
  );
}

Map<String, dynamic> _$SeedModelToJson(SeedModel instance) => <String, dynamic>{
      'seed': instance.seed,
      'expires_at': instance.expiresAt?.toIso8601String(),
    };
