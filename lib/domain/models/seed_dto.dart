/// A server data-transfer model for a Seed.
class SeedDTO {
  String seed;
  DateTime expiresAt;

  SeedDTO([this.seed, this.expiresAt]);

  Map<String, dynamic> toJson() {
    return {
      'seed' : seed,
      'expiresAt' : expiresAt.toIso8601String()
    };
  }

  SeedDTO.fromJson(Map<String, dynamic> json) {
    seed = json['seed'];
    expiresAt = DateTime.tryParse(json['expiresAt']);
  }
}