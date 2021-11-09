class SeedModel {
  String seed;
  DateTime expiresAt;

  SeedModel({required this.seed, required this.expiresAt});

  SeedModel.fromJson(Map<String, dynamic> json)
      : seed = json['seed'],
        expiresAt = DateTime.parse(json['expiresAt']);

  Map<String, dynamic> toJson() => {
        "seed": seed,
        "expiresAt": expiresAt.toIso8601String(),
      };
}
