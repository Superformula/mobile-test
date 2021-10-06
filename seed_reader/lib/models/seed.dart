import 'package:flutter/material.dart';

@immutable
class Seed {
  const Seed({
    required this.value,
    required this.expiration,
  });
  factory Seed.fromJson(Map<String, dynamic> json) {
    return Seed(
      value: json['seed'] as String,
      expiration: DateTime.parse(
        json['expires_at'] as String,
      ),
    );
  }

  final String value;
  final DateTime expiration;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'seed': value,
        'expires_at': expiration.toIso8601String(),
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Seed &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          expiration == other.expiration;

  @override
  int get hashCode => value.hashCode ^ expiration.hashCode;
}
