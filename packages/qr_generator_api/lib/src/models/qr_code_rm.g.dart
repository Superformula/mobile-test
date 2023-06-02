// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrCodeRM _$QrCodeRMFromJson(Map<String, dynamic> json) => QrCodeRM(
      seed: json['seed'] as String,
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
    );

Map<String, dynamic> _$QrCodeRMToJson(QrCodeRM instance) => <String, dynamic>{
      'seed': instance.seed,
      'expiresAt': instance.expiresAt?.toIso8601String(),
    };
