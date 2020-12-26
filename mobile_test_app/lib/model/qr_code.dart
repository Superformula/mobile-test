import 'package:meta/meta.dart';

class QrCode {
  final String code;
  final DateTime expiresAt;
  
  QrCode({
    @required this.code,
    @required this.expiresAt,
  });
}
