import 'package:flutter/material.dart';

@immutable
class Seed {
  const Seed({
    required this.value,
    required this.expiration,
  });
  factory Seed.fromJson(Map<String, dynamic> json) => Seed(
        value: json['value'] as String,
        expiration: DateTime.parse(
          json['expiration'] as String,
        ),
      );

  final String value;
  final DateTime expiration;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'value': value,
        'expiration': expiration.toIso8601String(),
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
