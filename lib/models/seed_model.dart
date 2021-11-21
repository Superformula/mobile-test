class SeedModel {
  final String seed;
  final String description;
  final String expirationDate;

  SeedModel({
    required this.seed,
    required this.description,
    required this.expirationDate,
  });

  factory SeedModel.fromJson(Map<String, dynamic> json) {
    return SeedModel(
      seed: json['seed'],
      description: json['description'],
      expirationDate: json['expires_at'],
    );
  }
}
