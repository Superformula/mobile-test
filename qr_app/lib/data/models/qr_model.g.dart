// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrModel _$QrModelFromJson(Map<String, dynamic> json) {
  return QrModel(
    seed: json['seed'] as String,
    expiresAt: json['expiresAt'] == null
        ? null
        : DateTime.parse(json['expiresAt'] as String),
  );
}

Map<String, dynamic> _$QrModelToJson(QrModel instance) => <String, dynamic>{
      'seed': instance.seed,
      'expiresAt': instance.expiresAt?.toIso8601String(),
    };
