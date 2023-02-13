import 'package:superformula_test/core/resources/result.dart';
import 'package:superformula_test/domain/repositories/qr_code_repository.dart';

abstract class QRCodeValidationUseCase {
  Future<Result<bool>> call();
}

class QRCodeValidationUseCaseImpl implements QRCodeValidationUseCase {
  final QRCodeRepository repository;

  QRCodeValidationUseCaseImpl(this.repository);

  @override
  Future<Result<bool>> call() => repository.validateQRCode();
}
