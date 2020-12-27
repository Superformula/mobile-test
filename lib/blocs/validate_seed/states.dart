import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class ValidateSeedState extends Equatable {
  @override
  List<Object> get props => [];
}

class SeedNotValidated extends ValidateSeedState {
  @override
  String toString() {
    return 'Seed not validated';
  }
}

class ValidatingSeed extends ValidateSeedState {
  @override
  String toString() {
    return 'Validating seed...';
  }
}

class SeedValid extends ValidateSeedState {
  final String seed;

  SeedValid({@required this.seed});

  @override
  List<Object> get props => [seed];

  @override
  String toString() {
    return 'Seed valid: $seed';
  }
}

class SeedInvalid extends ValidateSeedState {
  @override
  String toString() {
    return 'Seed invalid';
  }
}

class SeedValidationError extends ValidateSeedState {
  final String error;

  SeedValidationError({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'QR seed error: $error}';
  }
}
