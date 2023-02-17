import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:superformula_test/core/resources/result.dart';
import 'package:superformula_test/data/errors/failure.dart';
import 'package:superformula_test/domain/entities/qr_code_entity.dart';
import 'package:superformula_test/domain/repositories/qr_code_repository.dart';
import 'package:superformula_test/domain/use_cases/qr_code_get_seed_use_case.dart';

class QRCodeRepositoryMock extends Mock implements QRCodeRepository {}

void main() {
  late final QRCodeRepository qrCodeRepository;
  late final QRCodeGetSeedUseCase qrCodeGetSeedUseCase;

  setUpAll(
    () {
      qrCodeRepository = QRCodeRepositoryMock();
      qrCodeGetSeedUseCase = QRCodeGetSeedUseCaseImpl(qrCodeRepository);
    },
  );

  test(
    'WHEN repository returns successfully should return Result.success(QRCodeEntity)',
    () async {
      final qrCodeEntity = QRCodeEntity(
        seed: 'Testing',
        expiresAt: DateTime.now(),
      );

      when(() => qrCodeRepository.getSeed()).thenAnswer(
        (_) async => Result.success(qrCodeEntity),
      );

      final result = await qrCodeGetSeedUseCase();

      expect(result, isA<SuccessResult>());
      expect(result.asSuccess.data, equals(qrCodeEntity));
    },
  );

  test(
    'WHEN repository returns failure should return Result.failure(Failure)',
    () async {
      const failure = RepositoryFailure('');

      when(() => qrCodeRepository.getSeed()).thenAnswer(
        (_) async => const Result.failure(failure),
      );

      final result = await qrCodeGetSeedUseCase();

      expect(result, isA<FailureResult>());
      expect(result.asFailure.failure, equals(failure));
    },
  );
}
