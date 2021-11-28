import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_data.g.dart';

@JsonSerializable(createToJson: false)
class QrData {
  final String seed;
  @JsonKey(name: "expires_at")
  final DateTime expiresAt;

  QrData(this.seed, this.expiresAt);

  factory QrData.fromJson(final Map<String, dynamic> json) =>
      _$QrDataFromJson(json);
}
