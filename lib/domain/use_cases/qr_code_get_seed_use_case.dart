// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:superformula_test/core/resources/result.dart';
import 'package:superformula_test/domain/entities/qr_code_seed_entity.dart';
import 'package:superformula_test/domain/repositories/qr_code_seed_repository.dart';

abstract class QrCodeGetSeedUseCase {
  Future<Result<QrCodeSeedEntity>> call();
}

class QrCodeGetSeedUseCaseImpl implements QrCodeGetSeedUseCase {
  final QrCodeSeedRepository repository;

  QrCodeGetSeedUseCaseImpl(this.repository);

  @override
  Future<Result<QrCodeSeedEntity>> call() => repository.getSeed();
}
