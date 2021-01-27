class QRCode {
  String seed;
  DateTime expiresAt;

  QRCode({
    this.seed,
    this.expiresAt,
  });

  bool isValid(DateTime now) =>
      now.isBefore(this.expiresAt) || now.isAtSameMomentAs(this.expiresAt);

  Duration getRemainingTime(DateTime now) =>
      expiresAt.isAfter(now) ? expiresAt.difference(now) : Duration(seconds: 0);
}
