import 'package:meta/meta.dart';

class QrCode {
  final String code;
  final DateTime expiresAt;

  QrCode({
    @required this.code,
    @required this.expiresAt,
  });

  factory QrCode.fromJson(Map json) {
    final code = json['seed'];
    final expiresAt = DateTime.tryParse(json['expires_at'] ?? '');
    return QrCode(code: code, expiresAt: expiresAt ?? Duration(seconds: 10));
  }
}
