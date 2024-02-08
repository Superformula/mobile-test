import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:superformula_leandro/core/errors/failures/qr_code_failure.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/cubits/qr_code/qr_code_cubit.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/cubits/timer/timer_cubit.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/pages/qr_code/qr_code_page.dart';

import '../../../../../core/test_utils.dart';
import '../../../mocks/mocks.dart';
import '../../cubits/qr_code/qr_code_cubit_test.dart';

void main() {
  group('ScanPage |', () {
    late final QrCodeCubit qrCodeCubit;
    late final TimerCubit timerCubit;
    late final MockGetQrCodeUsecase mockGetQrCodeUsecase;

    setUpAll(() {
      mockGetQrCodeUsecase = MockGetQrCodeUsecase();
      qrCodeCubit = QrCodeCubit(getQrCodeUsecase: mockGetQrCodeUsecase);
      timerCubit = TimerCubit();
    });

    Future<void> pumpAndSettleWidget(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: qrCodeCubit,
                ),
                BlocProvider.value(
                  value: timerCubit,
                ),
              ],
              child: const QrCodePage(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
    }

    testWidgets(
        'should find the QrImageView widget when GetQrCode works correctly',
        (WidgetTester tester) async {
      FlutterError.onError = TestUtils.ignoreOverflowErrors;
      when(() => mockGetQrCodeUsecase()).thenAnswer(
        (_) async => Right(QrCodeScanMocks.qrCodeEntity),
      );
      await pumpAndSettleWidget(tester);
      expect(find.byType(QrImageView), findsOneWidget);
    });

    testWidgets('should find the exact error message when GetQrCode went wrong',
        (WidgetTester tester) async {
      FlutterError.onError = TestUtils.ignoreOverflowErrors;
      const qrCodeFailure =
          QrCodeFailure(message: 'Something went wrong. Try again later.');
      when(() => mockGetQrCodeUsecase()).thenAnswer(
        (_) async => const Left(qrCodeFailure),
      );
      await pumpAndSettleWidget(tester);
      expect(find.text(qrCodeFailure.message), findsOneWidget);
    });
  });
}
