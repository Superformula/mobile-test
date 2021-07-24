import 'package:qrtestcodeone/core/usecase.dart';
import 'package:qrtestcodeone/domain/entity/qr_seed.dart';
import 'package:qrtestcodeone/domain/repository/qrcode_repository.dart';

///
/// Created by Pablo Reyes [devpab@gmail.com] on 7/20/21.
///

class GetQrCodeSeedUseCase extends UseCase {
  final QrCodeRepository repository;

  GetQrCodeSeedUseCase(this.repository);

  Future<QrSeed> call() => repository.getSeed();
}
