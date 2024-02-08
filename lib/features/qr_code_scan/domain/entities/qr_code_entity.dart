base class QrCodeEntity {
  const QrCodeEntity({required this.seed, required this.expireAt});

  final String seed;
  final DateTime expireAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QrCodeEntity &&
          seed == other.seed &&
          expireAt.isAtSameMomentAs(other.expireAt));

  @override
  int get hashCode => seed.hashCode ^ expireAt.hashCode;
}
