class QrCodeSeedEntity {
  final String seed;
  final DateTime? expiresAt;

  QrCodeSeedEntity({
    required this.seed,
    this.expiresAt,
  });

  @override
  bool operator ==(covariant QrCodeSeedEntity other) {
    if (identical(this, other)) return true;

    return other.seed == seed && other.expiresAt == expiresAt;
  }

  @override
  int get hashCode => seed.hashCode ^ expiresAt.hashCode;
}
