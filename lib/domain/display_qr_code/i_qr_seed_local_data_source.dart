import 'package:superformula_mobile_test/infrastructure/display_qr_code/qr_seed_dto.dart';

abstract class IQrCodeLocalDataSource {
  /// The key used to store it locally
  static const cachedQRCode = 'cachedQRCode';

  Future<QrSeedDto> getLastQrSeed();
  Future<void> cacheQrSeed(QrSeedDto qrcodeToCache);
}
