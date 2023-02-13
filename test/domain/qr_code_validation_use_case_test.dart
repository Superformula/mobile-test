import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:superformula_test/core/resources/result.dart';
import 'package:superformula_test/domain/repositories/qr_code_repository.dart';
import 'package:superformula_test/domain/use_cases/qr_code_validation_use_case.dart';

class QRCodeRepositoryMock extends Mock implements QRCodeRepository {}

void main() {
  late final QRCodeRepository qrCodeRepository;
  late final QRCodeValidationUseCase qrCodeGetSeedUseCase;

  setUpAll(
    () {
      qrCodeRepository = QRCodeRepositoryMock();
      qrCodeGetSeedUseCase = QRCodeValidationUseCaseImpl(qrCodeRepository);
    },
  );

  test(
    'WHEN repository returns successfully should return Result.success(true)',
    () async {
      when(() => qrCodeRepository.validateQRCode()).thenAnswer(
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
      when(() => qrCodeRepository.validateQRCode()).thenAnswer(
        (_) async => Result.success(true),
      );

      final result = await qrCodeGetSeedUseCase();

      expect(result, isA<SuccessResult>());
      expect(result.asSuccess.data, isTrue);
    },
  );
}
