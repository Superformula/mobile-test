import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'qr_model.g.dart';

@JsonSerializable()
class QrModel {
  String seed;
  DateTime expiresAt;

  QrModel({this.seed, this.expiresAt});

  factory QrModel.fromJson(Map<String, dynamic> json) =>
      _$QrModelFromJson(json);

  Map<String, dynamic> toJson() => _$QrModelToJson(this);
}
