// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeedModel _$SeedModelFromJson(Map<String, dynamic> json) => SeedModel(
      id: json['id'] as String,
      expiresAt: DateTime.parse(json['expiresAt'] as String),
    );

Map<String, dynamic> _$SeedModelToJson(SeedModel instance) => <String, dynamic>{
      'id': instance.id,
      'expiresAt': instance.expiresAt.toIso8601String(),
    };
