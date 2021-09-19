import 'package:superformula_mobile_test/domain/core/either.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/entities/qr_seed.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/qr_seed_failure.dart';

abstract class IQrSeedRepository {
  Future<Either<QrSeedFailure, QrSeed>> getQrCodeSeed();
  Future<Either<QrSeedFailure, void>> validateQrCodeData();
}
