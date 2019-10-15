import 'package:json_annotation/json_annotation.dart';

part 'qr_code_models.g.dart';

@JsonSerializable()
class QrCode {
  String seed;
  int expireTime;

  QrCode(this.seed, this.expireTime);

  factory QrCode.fromJson(Map<String, dynamic> json) =>
      _$QrCodeFromJson(json);

  factory QrCode.empty() => QrCode("", 0);

  Map<String, dynamic> toJson() => _$QrCodeToJson(this);
}
