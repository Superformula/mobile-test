import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:superformula_challenge/models/models.dart';

class GetSeedState extends Equatable {
  @override
  List<Object> get props => [];
}

class SeedNotLoaded extends GetSeedState {
  @override
  String toString() {
    return 'QR seed not loaded';
  }
}

class SeedLoading extends GetSeedState {
  @override
  String toString() {
    return 'QR seed loading...';
  }
}

class SeedLoaded extends GetSeedState {
  final Seed seed;

  SeedLoaded({@required this.seed});

  @override
  List<Object> get props => [seed];

  @override
  String toString() {
    return 'QR seed loaded: $seed}';
  }
}

class SeedError extends GetSeedState {
  final String error;

  SeedError({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'QR seed error: $error}';
  }
}
