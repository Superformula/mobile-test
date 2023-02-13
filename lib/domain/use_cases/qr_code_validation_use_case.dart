import 'package:superformula_test/core/resources/result.dart';
import 'package:superformula_test/domain/repositories/qr_code_seed_repository.dart';

abstract class QrCodeValidationUseCase {
  Future<Result<bool>> call();
}

class QrCodeValidationUseCaseImpl implements QrCodeValidationUseCase {
  final QrCodeSeedRepository repository;

  QrCodeValidationUseCaseImpl(this.repository);

  @override
  Future<Result<bool>> call() => repository.validateQRCode();
}
