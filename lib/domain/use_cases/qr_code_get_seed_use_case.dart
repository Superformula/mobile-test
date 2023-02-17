import 'package:superformula_test/core/resources/result.dart';
import 'package:superformula_test/domain/entities/qr_code_entity.dart';
import 'package:superformula_test/domain/repositories/qr_code_repository.dart';

abstract class QRCodeGetSeedUseCase {
  const QRCodeGetSeedUseCase();

  Future<Result<QRCodeEntity>> call();
}

class QRCodeGetSeedUseCaseImpl implements QRCodeGetSeedUseCase {
  final QRCodeRepository repository;

  const QRCodeGetSeedUseCaseImpl(this.repository);

  @override
  Future<Result<QRCodeEntity>> call() => repository.getSeed();
}
