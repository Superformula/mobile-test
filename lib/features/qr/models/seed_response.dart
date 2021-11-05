import 'dart:convert';

import 'package:equatable/equatable.dart';

class SeedResponse extends Equatable {
  final String? seed;
  final String? expiresAt;
  final String? errorMessage;

  const SeedResponse({
    this.seed,
    this.expiresAt,
    this.errorMessage,
  });

  Map<String, dynamic> toMap() {
    return {
      'seed': seed,
      'expiresAt': expiresAt,
    };
  }

  factory SeedResponse.fromMap(Map<String, dynamic> map) {
    return SeedResponse(
      seed: map['seed'] != null ? map['seed'] : null,
       expiresAt: map['expiresAt'] != null ? map['expiresAt'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SeedResponse.fromJson(String source) =>
      SeedResponse.fromMap(json.decode(source));

  factory SeedResponse.fromException({String? errorMessage}) {
    return SeedResponse(
        errorMessage: errorMessage ??
            "Something wrong at the moment. PLease try again later");
  }

  @override
  List<Object?> get props => [
        seed,
        expiresAt,
        errorMessage,
      ];
}
