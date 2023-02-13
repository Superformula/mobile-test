
import 'package:equatable/equatable.dart';

class QRCodeModel extends Equatable {
  final String seed;
  final DateTime? expiresAt;

  const QRCodeModel({
    required this.seed,
    required this.expiresAt,
  });

  factory QRCodeModel.fromJson(Map<String, dynamic> json) {
    return QRCodeModel(
      seed: json['seed'] as String,
      expiresAt: DateTime.tryParse(json['expires_at']),
    );
  }

  @override
  List<Object?> get props => [seed, expiresAt];
}
