import 'package:qr_code_test/blocs/qrfetch/qrfetch.dart';

/// Fetches the seed for the QR code from an HTTP endpoint
abstract class QRRepository {
  const QRRepository();

  /// Fetches data from a specific data source.
  Future<Seed> getData();
}