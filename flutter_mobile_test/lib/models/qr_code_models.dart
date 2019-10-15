import 'package:json_annotation/json_annotation.dart';

part 'qr_code_models.g.dart';

@JsonSerializable()
class QrCode {
  String seed;

  QrCode(this.seed);

  factory QrCode.fromJson(Map<String, dynamic> json) =>
      _$QrCodeFromJson(json);

  Map<String, dynamic> toJson() => _$QrCodeToJson(this);
}
