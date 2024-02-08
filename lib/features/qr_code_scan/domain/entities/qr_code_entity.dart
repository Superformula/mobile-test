base class QrCodeEntity {
  const QrCodeEntity({required this.seed, required this.expiresAt});

  final String seed;
  final DateTime expiresAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QrCodeEntity &&
          seed == other.seed &&
          expiresAt.isAtSameMomentAs(other.expiresAt));

  @override
  int get hashCode => seed.hashCode ^ expiresAt.hashCode;
}
