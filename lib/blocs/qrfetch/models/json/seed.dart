import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Represent a random sequence of values to be used to generate a QR code.
/// There is also an expiration date which determines the validity duration of
/// the seed.
class Seed extends Equatable {
  /// The generated seed
  final String seed;
  /// When the seed expires
  final String expiryDate;

  /// A private constructor used internally to build instances
  const Seed._({
    @required this.seed,
    @required this.expiryDate
  });

  /// Builds a new [Seed] instance from a JSON-decoded object
  Seed.fromJson(Map<String, dynamic> json) : this._(
    seed: json["seed"] as String,
    expiryDate: json["expires_at"] as String
  );

  /// Converts the current instance into a JSON "encodeable" object
  Map<String, dynamic> toJson() => {
      'seed': seed,
      'expires_at': expiryDate,
  };

  @override
  List<Object> get props => [seed, expiryDate];
}