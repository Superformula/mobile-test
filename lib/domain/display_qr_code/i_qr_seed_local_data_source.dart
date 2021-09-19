import 'package:superformula_mobile_test/infrastructure/display_qr_code/qr_seed_dto.dart';

abstract class IQrCodeLocalDataSource {
  /// The key used to store it locally
  static const cachedQRCode = 'cachedQRCode';

  /// Gets the cached [QrSeedDto] which was gotten the last time
  /// the user had an internet connection.

  /// Throws [CacheException] if no cached data is present.
  Future<QrSeedDto> getLastQrSeed();

  Future<void> cacheQrSeed(QrSeedDto qrcodeToCache);
}
