class Seed {
  final String seed;
  final String expiresAt;

  Seed(this.seed, this.expiresAt);

  Seed.fromJson(Map<String, dynamic> json)
      : seed = json['seed'],
        expiresAt = json['expires_at'];

  Map<String, dynamic> toJson() => {
        'seed': seed,
        'expiresAt': expiresAt,
      };
}
