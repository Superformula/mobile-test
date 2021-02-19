class SeedResponse {
  SeedResponse({this.seed, this.expiresAt});

  factory SeedResponse.fromJson(Map<String, dynamic> json) => SeedResponse(
      seed: json['seed'] == null ? null : json['seed'],
      expiresAt: json['expiresAt'] == null ? null : json['expiresAt']);

  final String seed;
  final String expiresAt;
}
