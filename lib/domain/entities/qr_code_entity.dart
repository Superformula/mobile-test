class QRCodeEntity {
  final String seed;
  final DateTime? expiresAt;

  QRCodeEntity({
    required this.seed,
    this.expiresAt,
  });

  @override
  bool operator ==(covariant QRCodeEntity other) {
    if (identical(this, other)) return true;

    return other.seed == seed && other.expiresAt == expiresAt;
  }

  @override
  int get hashCode => seed.hashCode ^ expiresAt.hashCode;
}
