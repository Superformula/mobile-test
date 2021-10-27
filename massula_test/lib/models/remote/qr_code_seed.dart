class QrCodeSeed {
  final String? seed;
  final DateTime? expiresAt;

  QrCodeSeed({required this.seed, required this.expiresAt});

  QrCodeSeed.fromJson(Map<String, dynamic> json) :
    seed = json['seed'],
    expiresAt = DateTime.tryParse(json['expiresAt']);
}