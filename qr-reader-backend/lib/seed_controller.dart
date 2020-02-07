import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:qr_reader_backend/qr_reader_backend.dart';

class SeedController extends Controller {
  static const _expirationSeconds = 5;
  final _expiration = const Duration(seconds: _expirationSeconds);
  final _random = Random.secure();

  @override
  FutureOr<RequestOrResponse> handle(Request request) {
    final codes = List<int>.generate(32, (i) => _random.nextInt(256));
    final encoded = md5.convert(codes).toString();

    final date = DateTime.now().add(_expiration);

    return Response.ok({
      'seed': encoded,
      'expires_at': date.toIso8601String(),
      'seconds': _expirationSeconds, 
    });
  }
}
