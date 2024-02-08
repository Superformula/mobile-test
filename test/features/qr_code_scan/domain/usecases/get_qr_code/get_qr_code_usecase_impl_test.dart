import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:superformula_leandro/core/errors/failures/qr_code_failure.dart';
import 'package:superformula_leandro/features/qr_code_scan/domain/usecases/get_qr_code/get_qr_code_usecase_impl.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/mocktail.dart';

void main() {
  group('GetQrCodeUsecaseImpl |', () {
    late GetQrCodeUsecaseImpl usecase;
    late MockGetQrCodeRepository mockRepository;

    setUp(() {
      mockRepository = MockGetQrCodeRepository();
      usecase = GetQrCodeUsecaseImpl(getQrCodeRepository: mockRepository);
    });

    test(
        'should get QR code from the repository and check if it was called once',
        () async {
      when(() => mockRepository())
          .thenAnswer((_) async => Right(QrCodeScanMocks.qrCodeEntity));
      final result = await usecase();
      expect(result, equals(Right(QrCodeScanMocks.qrCodeEntity)));
      verify(() => mockRepository()).called(1);
    });

    test(
        'should return a failure when repository call fails and check if it was called once',
        () async {
      const failure = QrCodeFailure(message: 'Failed to get QR code');
      when(() => mockRepository()).thenAnswer((_) async => const Left(failure));
      final result = await usecase();
      expect(result, equals(const Left(failure)));
      verify(() => mockRepository()).called(1);
    });
  });
}
