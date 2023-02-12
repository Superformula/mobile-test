
class QrCodeSeedModel {
  final String seed;
  final DateTime? expiresAt;

  QrCodeSeedModel({
    required this.seed,
    required this.expiresAt,
  });

  factory QrCodeSeedModel.fromJson(Map<String, dynamic> json) {
    return QrCodeSeedModel(
      seed: json['seed'] as String,
      expiresAt: DateTime.tryParse(json['expires_at']),
    );
  }
}
