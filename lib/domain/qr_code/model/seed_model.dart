///Seed Model used for the get request
class Seed {
  Seed({
    this.seed,
    this.expiresAt,
  });

  String? seed;
  DateTime? expiresAt;

  factory Seed.fromJson(Map<String, dynamic> json) => Seed(
        seed: json["Seed"],
        expiresAt: DateTime.parse(json["Expires_At"]),
      );

  Map<String, dynamic> toJson() => {
        "Seed": seed,
        "Expires_At": expiresAt?.toIso8601String(),
      };
}
