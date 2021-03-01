// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeedModel _$SeedModelFromJson(Map<String, dynamic> json) {
  return SeedModel(
    seed: json['seed'] as String,
    expiresAt: json['expiresAt'] == null
        ? null
        : DateTime.parse(json['expiresAt'] as String),
  );
}

Map<String, dynamic> _$SeedModelToJson(SeedModel instance) => <String, dynamic>{
      'seed': instance.seed,
      'expiresAt': instance.expiresAt?.toIso8601String(),
    };
