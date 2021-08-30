class QRSeed {
  final String seed;
  final DateTime expirationDate;

  QRSeed(this.seed, this.expirationDate);

  factory QRSeed.fromJson(Map<String, dynamic> json) {
    return QRSeed(
      json["seed"],
      DateTime.parse(json["expires_at"])
    );
  }
}