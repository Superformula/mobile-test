import 'package:flutter/foundation.dart';

/// A domain model for a Seed.
class Seed {
  String seed;
  DateTime expiresAt;

  Seed({@required this.seed, @required this.expiresAt});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Seed &&
          runtimeType == other.runtimeType &&
          seed == other.seed &&
          expiresAt == other.expiresAt;

  @override
  int get hashCode => seed.hashCode ^ expiresAt.hashCode;

  @override
  String toString() {
    return 'Seed{seed: $seed, expiresAt: $expiresAt}';
  }
}