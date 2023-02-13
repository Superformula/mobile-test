import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:superformula_test/core/resources/result.dart';
import 'package:superformula_test/data/errors/failure.dart';
import 'package:superformula_test/domain/repositories/qr_code_seed_repository.dart';
import 'package:superformula_test/domain/use_cases/qr_code_validation_use_case.dart';

class QrCodeSeedRepositoryMock extends Mock implements QrCodeSeedRepository {}

void main() {
  late final QrCodeSeedRepository qrCodeSeedRepository;
  late final QrCodeValidationUseCase qrCodeGetSeedUseCase;

  setUpAll(
    () {
      qrCodeSeedRepository = QrCodeSeedRepositoryMock();
      qrCodeGetSeedUseCase = QrCodeValidationUseCaseImpl(qrCodeSeedRepository);
    },
  );

  test(
    'WHEN repository returns successfully should return Result.success(true)',
    () async {
      when(() => qrCodeSeedRepository.validateQRCode()).thenAnswer(
        (_) async => Result.success(false),
      );

      final result = await qrCodeGetSeedUseCase();

      expect(result, isA<SuccessResult>());
      expect(result.asSuccess.data, isFalse);
    },
  );

  test(
    'WHEN repository returns successfully should return Result.success(true)',
    () async {
      when(() => qrCodeSeedRepository.validateQRCode()).thenAnswer(
        (_) async => Result.success(true),
      );

      final result = await qrCodeGetSeedUseCase();

      expect(result, isA<SuccessResult>());
      expect(result.asSuccess.data, isTrue);
    },
  );
}
