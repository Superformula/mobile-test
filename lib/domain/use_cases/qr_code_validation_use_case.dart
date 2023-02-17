import 'package:superformula_test/core/resources/result.dart';
import 'package:superformula_test/domain/repositories/qr_code_repository.dart';

abstract class QRCodeValidationUseCase {
  const QRCodeValidationUseCase();

  Future<Result<bool>> call();
}

class QRCodeValidationUseCaseImpl implements QRCodeValidationUseCase {
  final QRCodeRepository repository;

  const QRCodeValidationUseCaseImpl(this.repository);

  @override
  Future<Result<bool>> call() => repository.validateQRCode();
}
