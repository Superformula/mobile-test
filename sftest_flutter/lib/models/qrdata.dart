
class QRData {
  String seed;
  DateTime expiresAt;

  QRData(
      {this.seed,
      this.expiresAt}
      );

  QRData.fromJson(Map<String, dynamic> json) {
    seed = json['seed'];
    expiresAt = DateTime.parse(json['expiresAt']);
  }

}

