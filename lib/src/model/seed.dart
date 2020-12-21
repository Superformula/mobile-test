class SeedResponse {
  SeedResponse({this.seed, this.expiresAt});

  factory SeedResponse.fromJson(Map<String, dynamic> json) => SeedResponse(
      seed: json['seed'] == null ? 0.0 : json['seed'],
      expiresAt: json['expiresAt'] == null
          ? DateTime.now().toString()
          : json['expiresAt']);

  final String seed;
  final String expiresAt;
}
