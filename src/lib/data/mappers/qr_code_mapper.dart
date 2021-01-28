import 'package:qrcodevalidator/domain/entities/qr_code.dart';

class QRCodeMapper {
  static QRCode fromMap(Map<String, dynamic> data) {
    assert(data != null, 'Data map is required');
    assert(data?.containsKey('seed') == true && data['seed'] != null,
        'Seed is required');
    assert(
        data?.containsKey('expires_at') == true && data['expires_at'] != null,
        'ExpiresAt is required');

    var expiresAt = DateTime.tryParse(data['expires_at']);

    assert(expiresAt != null, 'Invalid expiration');

    return QRCode(
      seed: data['seed'],
      expiresAt: DateTime.parse(data['expires_at']),
    );
  }

  static Map<String, dynamic> toMap(QRCode qrCode) {
    return {
      'seed': qrCode.seed,
      'expires_at': qrCode.expiresAt.toString(),
    };
  }
}
