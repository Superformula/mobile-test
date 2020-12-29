import 'package:meta/meta.dart';

class QrCode {
  final String code;
  final DateTime expiresAt;

  QrCode({
    @required this.code,
    @required this.expiresAt,
  });

  factory QrCode.fromJson(Map json) {
    final code = json['seed'] as String;
    final DateTime expiresAt =
        DateTime.tryParse(json['expires_at'] as String ?? '');
    return QrCode(
        code: code,
        expiresAt:
            expiresAt ?? DateTime.now().add(const Duration(seconds: 10)));
  }

  Map<String, String> toJson() =>
      {'seed': code, 'expires_at': expiresAt.toIso8601String()};
}
