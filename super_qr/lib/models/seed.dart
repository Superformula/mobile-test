/// Model for a "Seed", contains a `seed` String value and a `expiresAt` DateTime value.
class Seed {
  final String seed;
  final DateTime expiresAt;

  Seed(this.seed, this.expiresAt);

  Seed.fromJson(Map<dynamic, dynamic> json)
      : seed = json['seed'],
        expiresAt = DateTime.parse(json['expires_at']);

  Map<String, dynamic> toJson() => {
        'seed': seed,
        'expiresAt': expiresAt.toUtc(),
      };
}
