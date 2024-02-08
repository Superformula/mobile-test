import 'package:superformula_leandro/features/qr_code_scan/domain/entities/qr_code_entity.dart';

final class QrCodeModel extends QrCodeEntity {
  const QrCodeModel({required super.seed, required super.expiresAt});

  factory QrCodeModel.fromMap(Map<String, dynamic> map) => QrCodeModel(
        seed: map['seed'],
        expiresAt: DateTime.parse(map['expires_at']),
      );
}
