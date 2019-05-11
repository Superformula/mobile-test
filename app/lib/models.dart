class Seed {
  final String seed;
  final DateTime expiresAt;

  Seed(this.seed, this.expiresAt);

  Seed.fromJson(Map<String, dynamic> json)
      : seed = json['seed'],
        expiresAt = DateTime.parse(json['expires_at']);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Seed &&
          runtimeType == other.runtimeType &&
          seed == other.seed &&
          expiresAt == other.expiresAt;

  @override
  int get hashCode => seed.hashCode ^ expiresAt.hashCode;
}
