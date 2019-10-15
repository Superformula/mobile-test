// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrCode _$QrCodeFromJson(Map<String, dynamic> json) {
  return QrCode(
    json['seed'] as String,
    json['expireTime'] as int,
  );
}

Map<String, dynamic> _$QrCodeToJson(QrCode instance) => <String, dynamic>{
      'seed': instance.seed,
      'expireTime': instance.expireTime,
    };
