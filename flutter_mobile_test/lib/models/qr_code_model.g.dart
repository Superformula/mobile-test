// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrCode _$QrCodeFromJson(Map<String, dynamic> json) {
  return QrCode(
    json['seed'] as String,
    json['expires_at'] as String,
  );
}

Map<String, dynamic> _$QrCodeToJson(QrCode instance) => <String, dynamic>{
      'seed': instance.seed,
      'expires_at': instance.expiresAt,
    };
