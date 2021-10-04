import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superformula_mobile_test/application/display_qr_code/display_qr_code_bloc.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/entities/qr_seed.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/value_objects/qr_seed_data.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/value_objects/qr_seed_expiration_date.dart';
import 'package:superformula_mobile_test/presentation/display_qr_code/widgets/qr_code_error_widget.dart';

import '../../../setup/test_helpers.dart';

void main() {
  group('QrCodeErrorWidget -', () {
    setUp(registerServices);
    tearDown(unregisterServices);

    const seed = '1';
    const expirationDate = '2020-01-01T00:00:00Z';
    final qrCode = QrSeed(
        seed: QrSeedData(seed),
        expiresAt: QrSeedExpirationDate.withString(expirationDate));

    testWidgets('Finds refresh button and sends event to DisplayQrCodeBloc',
        (tester) async {
      // arrange
      final mockRepository = getAndRegisterIQrSeedRepository();
      final bloc = DisplayQrCodeBloc();
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: BlocProvider.value(
            value: bloc,
            child: const QrCodeErrorWidget(),
          ),
        ),
      ));
      final refreshButton = find.byType(ElevatedButton);
      final expected = [
        const DisplayQrCodeState.loadInProgress(),
        DisplayQrCodeState.loadSuccess(qrCode),
      ];

      // ignore: unawaited_futures
      expectLater(bloc.stream, emitsInOrder(expected));

      // act & assert
      expect(refreshButton, findsOneWidget);
      await tester.tap(refreshButton);
      await tester.pumpAndSettle();
      await untilCalled(mockRepository.getQrCodeSeed());
      verify(mockRepository.getQrCodeSeed());
    });
  });
}
