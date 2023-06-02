import 'package:json_annotation/json_annotation.dart';

part 'qr_code_rm.g.dart';

@JsonSerializable(createToJson: false)
class QrCodeRM {
  const QrCodeRM({
    required this.seed,
    this.expiresAt,
  });

  final String seed;

  @JsonKey(name: 'expires_at')
  final DateTime? expiresAt;

  static const fromJson = _$QrCodeRMFromJson;
}
