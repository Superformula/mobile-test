class QrCodeSeedEntity {
  final String seed;
  final DateTime? expiresAt;

  QrCodeSeedEntity({
    required this.seed,
    this.expiresAt,
  });
}
