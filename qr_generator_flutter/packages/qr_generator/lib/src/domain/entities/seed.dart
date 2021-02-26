import 'package:meta/meta.dart';

import 'package:equatable/equatable.dart';

/// Class representation of Seed object
class Seed extends Equatable {
  /// Creates a seed object
  Seed({
    @required this.seed,
    @required this.expiresAt,
  });

  /// Seed string
  final String seed;

  /// Expiration datetime
  final DateTime expiresAt;

  @override
  List<Object> get props => [seed, expiresAt];
}
