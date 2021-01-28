import 'package:qrcodevalidator/domain/entities/qr_code.dart';

class QRCodeMapper {
  static QRCode fromMap(Map<String, dynamic> data) {
    assert(data != null, 'Data map is required');
    assert(data?.containsKey('seed') == true && data['seed'] != null,
        'Seed is required');
    assert(data?.containsKey('expiresAt') == true && data['expiresAt'] != null,
        'ExpiresAt is required');

    var expiresAt = DateTime.tryParse(data['expiresAt']);

    assert(expiresAt != null, 'Invalid expiration');

    return QRCode(
      seed: data['seed'],
      expiresAt: DateTime.parse(data['expiresAt']),
    );
  }

  static Map<String, dynamic> toMap(QRCode qrCode) {
    return {
      'seed': qrCode.seed,
      'expiresAt': qrCode.expiresAt.toString(),
    };
  }
}
