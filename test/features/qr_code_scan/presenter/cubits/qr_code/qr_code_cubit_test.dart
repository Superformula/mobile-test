import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:superformula_leandro/core/errors/failures/qr_code_failure.dart';
import 'package:superformula_leandro/features/qr_code_scan/domain/usecases/get_qr_code/get_qr_code_usecase.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/cubits/qr_code/qr_code_cubit.dart';

import '../../../mocks/mocks.dart';

class MockGetQrCodeUsecase extends Mock implements GetQrCodeUsecase {}

void main() {
  group('QrCodeCubit |', () {
    late QrCodeCubit qrCodeCubit;
    late MockGetQrCodeUsecase mockGetQrCodeUsecase;

    setUp(() {
      mockGetQrCodeUsecase = MockGetQrCodeUsecase();
      qrCodeCubit = QrCodeCubit(getQrCodeUsecase: mockGetQrCodeUsecase);
    });

    tearDown(() {
      qrCodeCubit.close();
    });

    test('initial state should be QrCodeInitialState', () {
      expect(qrCodeCubit.state, equals(const QrCodeInitialState()));
    });

    blocTest<QrCodeCubit, QrCodeState>(
      'should emit [QrCodeLoadingState, QrCodeLoadedState] when getQrCode is called successfully',
      build: () => qrCodeCubit,
      act: (cubit) {
        when(() => mockGetQrCodeUsecase()).thenAnswer(
          (_) async => Right(QrCodeScanMocks.qrCodeEntity),
        );
        cubit.getQrCode();
      },
      expect: () => <QrCodeState>[
        const QrCodeLoadingState(),
        QrCodeLoadedState(qrCodeEntity: QrCodeScanMocks.qrCodeEntity),
      ],
    );

    blocTest<QrCodeCubit, QrCodeState>(
      'should emit [QrCodeLoadingState, QrCodeErrorState] when getQrCode fails',
      build: () => qrCodeCubit,
      act: (cubit) {
        when(() => mockGetQrCodeUsecase()).thenAnswer(
          (_) async =>
              const Left(QrCodeFailure(message: 'Failed to get QR code')),
        );
        cubit.getQrCode();
      },
      expect: () => const <QrCodeState>[
        QrCodeLoadingState(),
        QrCodeErrorState(errorMessage: 'Failed to get QR code'),
      ],
    );
  });
}
