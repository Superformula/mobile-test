import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class QrCodeSeed extends Equatable {
  final String? seed;
  final DateTime? expiresAt;

  QrCodeSeed({required this.seed, required this.expiresAt});

  QrCodeSeed.fromJson(Map<String, dynamic> json) :
    seed = json['seed'],
    expiresAt = DateTime.tryParse(json['expiresAt']);

  @override
  List<Object?> get props => [seed, expiresAt];
}