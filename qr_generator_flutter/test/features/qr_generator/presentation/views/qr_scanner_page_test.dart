import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:qr_generator/qr_generator.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/logic/qr_generator_cubit.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/logic/qr_generator_state.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/views/qr_scanner_page.dart';

class MockGetSeed extends Mock implements GetSeed {}

class MockQrGeneratorCubit extends MockBloc<QrGeneratorState>
    implements QrGeneratorCubit {}

void main() {
  group('QrScannerPage', () {
    QrGeneratorCubit qrGeneratorCubit;
    setUp(() {
      qrGeneratorCubit = MockQrGeneratorCubit();
    });

    test('has a route', () {
      expect(QrScannerPage.route(), isA<MaterialPageRoute>());
    });

    testWidgets('renders a QrScannerPage', (tester) async {
      ///arrange
      when(qrGeneratorCubit.state).thenReturn(const Initial());

      ///act
      await tester.pumpWidget(BlocProvider.value(
        value: qrGeneratorCubit,
        child: MaterialApp(home: QrScannerPage()),
      ));

      ///expect
      expect(find.byKey(kScannerBody), findsOneWidget);
    });

    testWidgets('renders a Start Qr Scan button', (tester) async {
      ///arrange
      when(qrGeneratorCubit.state).thenReturn(const Initial());

      ///act
      await tester.pumpWidget(BlocProvider.value(
        value: qrGeneratorCubit,
        child: MaterialApp(home: QrScannerPage()),
      ));

      ///expect
      expect(find.byKey(kQrScanButton), findsOneWidget);
    });
  });
}
