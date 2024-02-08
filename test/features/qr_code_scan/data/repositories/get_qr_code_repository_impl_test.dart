import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:superformula_leandro/core/errors/exceptions/qr_code_exception.dart';
import 'package:superformula_leandro/core/errors/failures/qr_code_failure.dart';
import 'package:superformula_leandro/features/qr_code_scan/data/repositories/get_qr_code_repository_impl.dart';

import '../../mocks/mocks.dart';
import '../../mocks/mocktail.dart';

void main() {
  group('GetQrCodeRepositoryImpl |', () {
    late GetQrCodeRepositoryImpl repository;
    late MockGetQrCodeDatasource mockDatasource;

    setUp(() {
      mockDatasource = MockGetQrCodeDatasource();
      repository = GetQrCodeRepositoryImpl(getQrCodeDatasource: mockDatasource);
    });

    test(
        'should return QrCodeEntity when datasource call is successful and check if it was called once',
        () async {
      when(() => mockDatasource())
          .thenAnswer((_) async => QrCodeScanMocks.qrCodeModel);
      final result = await repository();
      expect(result, equals(Right(QrCodeScanMocks.qrCodeEntity)));
      verify(() => mockDatasource()).called(1);
    });

    test(
        'should return QrCodeFailure when datasource call throws exception and check if it was called once',
        () async {
      final exception = QrCodeException(
        message: 'Failed to fetch QR code',
        error: 'Error',
        stackTrace: StackTrace.current,
      );
      when(() => mockDatasource()).thenThrow(exception);
      final result = await repository();
      expect(result, equals(Left(QrCodeFailure(message: exception.message))));
      verify(() => mockDatasource()).called(1);
    });
  });
}
