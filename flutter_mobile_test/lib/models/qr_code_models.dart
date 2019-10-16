import 'package:json_annotation/json_annotation.dart';

part 'qr_code_models.g.dart';

@JsonSerializable()
class QrCode {
  String seed;
  @JsonKey(name: "expires_at")
  String expiresAt;

  QrCode(this.seed, this.expiresAt);

  factory QrCode.fromJson(Map<String, dynamic> json) =>
      _$QrCodeFromJson(json);

  factory QrCode.empty() => QrCode("", "");

  Map<String, dynamic> toJson() => _$QrCodeToJson(this);
}
