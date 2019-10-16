// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Validation _$ValidationFromJson(Map<String, dynamic> json) {
  return Validation(
    json['is_valid'] as bool,
  );
}

Map<String, dynamic> _$ValidationToJson(Validation instance) =>
    <String, dynamic>{
      'is_valid': instance.isValid,
    };
