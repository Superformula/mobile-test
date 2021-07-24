// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_seed_datamodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrSeedDataModel _$QrSeedDataModelFromJson(Map<String, dynamic> json) {
  return QrSeedDataModel(
    json['seed'] as String,
    DateTime.parse(json['expires_at'] as String),
  );
}

Map<String, dynamic> _$QrSeedDataModelToJson(QrSeedDataModel instance) =>
    <String, dynamic>{
      'seed': instance.seed,
      'expires_at': instance.expiresAt.toIso8601String(),
    };
