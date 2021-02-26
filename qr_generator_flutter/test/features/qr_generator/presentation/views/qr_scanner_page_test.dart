import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:qr_generator/qr_generator.dart';
import 'package:qr_generator_flutter/src/features/qr_scanner/logic/qr_scanner_cubit.dart';
import 'package:qr_generator_flutter/src/features/qr_scanner/logic/qr_scanner_state.dart';
import 'package:qr_generator_flutter/src/features/qr_scanner/views/qr_scanner_page.dart';
import 'package:qr_generator_flutter/src/features/qr_scanner/views/qr_scanner_page_i18n.dart';

class MockGetSeed extends Mock implements GetSeed {}

class MockQrScannerCubit extends MockBloc<QrScannerState>
    implements QrScannerCubit {}

void main() {
  group('QrScannerPage', () {
    QrScannerCubit qrScannerCubit;
    setUp(() {
      qrScannerCubit = MockQrScannerCubit();
    });

    test('has a route', () {
      expect(QrScannerPage.route(), isA<MaterialPageRoute>());
    });

    testWidgets('renders a QrScannerPage', (tester) async {
      ///arrange
      when(qrScannerCubit.state).thenReturn(const Initial());

      ///act
      await tester.pumpWidget(BlocProvider.value(
        value: qrScannerCubit,
        child: const MaterialApp(home: QrScannerPage()),
      ));

      ///expect
      expect(find.byKey(kScannerBody), findsOneWidget);
    });

    testWidgets('renders a Start Qr Scan button', (tester) async {
      ///arrange
      when(qrScannerCubit.state).thenReturn(const Initial());

      ///act
      await tester.pumpWidget(BlocProvider.value(
        value: qrScannerCubit,
        child: const MaterialApp(home: QrScannerPage()),
      ));

      ///expect
      expect(find.byKey(kQrScanButton), findsOneWidget);
    });
    testWidgets('renders Initial Text for Initial', (tester) async {
      ///Arrange
      when(qrScannerCubit.state).thenReturn(const Initial());

      ///act
      await tester.pumpWidget(BlocProvider.value(
        value: qrScannerCubit,
        child: const MaterialApp(home: QrScannerPage()),
      ));

      ///expect
      expect(find.text(kNoCodeScanned.i18n), findsOneWidget);
    });

    testWidgets('renders No Scanned Text for Error', (tester) async {
      ///Arrange
      when(qrScannerCubit.state).thenReturn(const Error());

      ///Act
      await tester.pumpWidget(BlocProvider.value(
        value: qrScannerCubit,
        child: const MaterialApp(home: QrScannerPage()),
      ));

      ///Expect
      expect(find.text(kNoCodeScanned.i18n), findsOneWidget);
    });

    testWidgets('renders code text for Data', (tester) async {
      const code = 'NewCode';

      ///Arrange
      when(qrScannerCubit.state).thenReturn(const Data(code: code));

      ///Act
      await tester.pumpWidget(BlocProvider.value(
        value: qrScannerCubit,
        child: const MaterialApp(home: QrScannerPage()),
      ));

      ///Expect
      expect(find.text(code), findsOneWidget);
    });
  });
}
