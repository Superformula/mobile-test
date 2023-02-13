import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:superformula_test/core/resources/result.dart';
import 'package:superformula_test/data/errors/failure.dart';
import 'package:superformula_test/domain/entities/qr_code_seed_entity.dart';
import 'package:superformula_test/domain/repositories/qr_code_seed_repository.dart';
import 'package:superformula_test/domain/use_cases/qr_code_get_seed_use_case.dart';

class QrCodeSeedRepositoryMock extends Mock implements QrCodeSeedRepository {}

void main() {
  late final QrCodeSeedRepository qrCodeSeedRepository;
  late final QrCodeGetSeedUseCase qrCodeGetSeedUseCase;

  setUpAll(
    () {
      qrCodeSeedRepository = QrCodeSeedRepositoryMock();
      qrCodeGetSeedUseCase = QrCodeGetSeedUseCaseImpl(qrCodeSeedRepository);
    },
  );

  test(
    'WHEN repository returns successfully should return Result.success(QrCodeSeedEntity)',
    () async {
      final qrCodeEntity = QrCodeSeedEntity(
        seed: 'Testing',
        expiresAt: DateTime.now(),
      );

      when(() => qrCodeSeedRepository.getSeed()).thenAnswer(
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
      final failure = RepositoryFailure('');

      when(() => qrCodeSeedRepository.getSeed()).thenAnswer(
        (_) async => Result.failure(failure),
      );

      final result = await qrCodeGetSeedUseCase();

      expect(result, isA<FailureResult>());
      expect(result.asFailure.failure, equals(failure));
    },
  );
}
