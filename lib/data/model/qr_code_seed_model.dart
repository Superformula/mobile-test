import 'package:equatable/equatable.dart';

class QrCodeSeedModel extends Equatable {
  final String seed;
  final DateTime? expiresAt;

  const QrCodeSeedModel({
    required this.seed,
    required this.expiresAt,
  });

  factory QrCodeSeedModel.fromJson(Map<String, dynamic> json) {
    return QrCodeSeedModel(
      seed: json['seed'] as String,
      expiresAt: DateTime.tryParse(json['expires_at']),
    );
  }

  @override
  List<Object?> get props => [seed, expiresAt];
}
