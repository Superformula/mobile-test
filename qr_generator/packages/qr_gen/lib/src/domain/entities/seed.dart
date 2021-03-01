import 'package:equatable/equatable.dart';

///
/// * Seed entity
///
class Seed extends Equatable {
  /// Defines a random seed used to create QR code.
  Seed({
    this.seed,
    this.expiresAt,
  });

  /// Actual seed string.
  final String seed;

  /// ISO date-time that contains when the seed expires.
  final DateTime expiresAt;

  @override
  List<Object> get props => [seed, expiresAt];
}
