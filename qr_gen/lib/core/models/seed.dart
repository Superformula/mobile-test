import 'dart:convert';

class Seed {
  final String seed;
  final DateTime expiresAt;

  Seed({this.seed, this.expiresAt});

  Seed.fromJson(Map<String, dynamic> json)
      : seed = json['seed'],
        expiresAt = DateTime.parse(json['expires_at']);

  Map<String, dynamic> _toJson() => {
        'seed': seed,
        'expires_at': expiresAt.toIso8601String(),
      };

  String encode() => jsonEncode(_toJson());
}
