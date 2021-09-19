import 'package:superformula_mobile_test/infrastructure/display_qr_code/qr_seed_dto.dart';

abstract class IQrCodeRemoteDataSource {
  Future<QrSeedDto> getRandomSeed();
  Future<void> validateQrCodeData();
}
