import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:superformula_challenge/models/models.dart';

class QrState extends Equatable {
  @override
  List<Object> get props => [];
}

class SeedNotLoaded extends QrState {
  @override
  String toString() {
    return 'QR seed not loaded';
  }
}

class SeedLoading extends QrState {
  @override
  String toString() {
    return 'QR seed loading...';
  }
}

class SeedLoaded extends QrState {
  final Seed seed;

  SeedLoaded({@required this.seed});

  @override
  List<Object> get props => [seed];

  @override
  String toString() {
    return 'QR seed loaded: $seed}';
  }
}
