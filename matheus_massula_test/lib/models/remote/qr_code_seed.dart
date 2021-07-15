class QRCodeSeed {
  final String seed;
  final DateTime expiresAt;

  QRCodeSeed({required this.seed, required this.expiresAt});

  QRCodeSeed.fromJson(Map<String, dynamic> json) :
    seed = json['seed'],
    expiresAt = DateTime.parse(json['expiresAt']);
}