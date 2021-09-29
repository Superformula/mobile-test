import 'package:qr_api/src/api/api_result.dart';
import 'package:qr_models/qr_models.dart';

/// This repository handles all the operations related with seed for QR codes
abstract class SeedRepository {
  /// Fetch the seed model from the server and return a [QRSeed]
  Future<ApiResult<QRSeed>> fetchSeed();
}
