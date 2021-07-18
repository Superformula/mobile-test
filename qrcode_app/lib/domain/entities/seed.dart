import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Seed extends Equatable {
  final String seed;
  final DateTime expirationDate;

  const Seed({required this.seed, required this.expirationDate});
  @override
  List<Object?> get props => [
        seed,
        expirationDate,
      ];
}
