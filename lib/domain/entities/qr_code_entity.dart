class QRCodeEntity {
  final String seed;
  final DateTime? expiresAt;

  const QRCodeEntity({
    required this.seed,
    this.expiresAt,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other is QRCodeEntity) {
      return other.seed == seed && other.expiresAt == expiresAt;
    }

    return false;
  }

  @override
  int get hashCode => seed.hashCode ^ expiresAt.hashCode;
}
