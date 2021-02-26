import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:qr_generator/qr_generator.dart';
import 'package:qr_generator_flutter/src/core/widgets/animated_floating_action_button.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/logic/qr_generator_cubit.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/logic/qr_generator_state.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/views/qr_generator_page.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/views/qr_generator_page_i18n.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/views/qr_scanner_page.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/views/widgets/qr_code_widget.dart';

class MockGetSeed extends Mock implements GetSeed {}

class MockQrGeneratorCubit extends MockBloc<QrGeneratorState>
    implements QrGeneratorCubit {}

void main() {
  group('QrGeneratorPage', () {
    final tSeed = Seed(
      seed: 'seed',
      expiresAt: DateTime.now().add(const Duration(seconds: 15)),
    );

    QrGeneratorCubit qrGeneratorCubit;
    setUp(() {
      qrGeneratorCubit = MockQrGeneratorCubit();
    });

    test('has a route', () {
      expect(QrGeneratorPage.route(), isA<MaterialPageRoute>());
    });

    testWidgets('renders a QrGeneratorPage', (tester) async {
      ///arrange
      when(qrGeneratorCubit.state).thenReturn(const Initial());

      ///act
      await tester.pumpWidget(BlocProvider.value(
        value: qrGeneratorCubit,
        child: const MaterialApp(home: QrGeneratorPage()),
      ));

      ///expect
      expect(find.byKey(kBodyKey), findsOneWidget);
    });

    testWidgets('renders WeatherEmpty for WeatherStatus.initial',
        (tester) async {
      ///Arrange
      when(qrGeneratorCubit.state).thenReturn(const Initial());

      ///act
      await tester.pumpWidget(BlocProvider.value(
        value: qrGeneratorCubit,
        child: const MaterialApp(home: QrGeneratorPage()),
      ));

      ///expect
      expect(find.text(kWelcomeText.i18n), findsOneWidget);
    });

    testWidgets('renders CircularProgress for Loading', (tester) async {
      ///Arrange
      when(qrGeneratorCubit.state).thenReturn(const Loading());

      ///Act
      await tester.pumpWidget(BlocProvider.value(
        value: qrGeneratorCubit,
        child: const MaterialApp(home: QrGeneratorPage()),
      ));

      ///Expect
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders QrWidget for Data', (tester) async {
      ///Arrange
      when(qrGeneratorCubit.state).thenReturn(Data(seed: tSeed));

      ///Act
      await tester.pumpWidget(BlocProvider.value(
        value: qrGeneratorCubit,
        child: const MaterialApp(home: QrGeneratorPage()),
      ));

      ///Expect
      expect(find.byType(QrCodeWidget), findsOneWidget);
    });

    testWidgets('renders Error Text for Error', (tester) async {
      ///Arrange
      when(qrGeneratorCubit.state).thenReturn(const Error());

      ///Act
      await tester.pumpWidget(BlocProvider.value(
        value: qrGeneratorCubit,
        child: const MaterialApp(home: QrGeneratorPage()),
      ));

      ///Expect
      expect(find.text(kError.i18n), findsOneWidget);
    });

    testWidgets('renders Expired Text for Expired', (tester) async {
      ///Arrange
      when(qrGeneratorCubit.state).thenReturn(const Expired());

      ///Act
      await tester.pumpWidget(BlocProvider.value(
        value: qrGeneratorCubit,
        child: const MaterialApp(home: QrGeneratorPage()),
      ));

      ///Expect
      expect(find.text(kCodeExpired.i18n), findsOneWidget);
    });

    testWidgets('navigates to QrScanPage when scan icon is tapped',
        (tester) async {
      ///Arrange
      when(qrGeneratorCubit.state).thenReturn(const Initial());

      ///Act
      await tester.pumpWidget(BlocProvider.value(
        value: qrGeneratorCubit,
        child: const MaterialApp(home: QrGeneratorPage()),
      ));
      await tester.tap(find.byKey(kPrimaryFloatingButton));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(kScanQrButton));
      await tester.pumpAndSettle();

      ///Expect
      expect(find.byType(QrScannerPage), findsOneWidget);
    });

    testWidgets('triggers getSeed when generate qr button is pressed',
        (tester) async {
      ///Arrange
      when(qrGeneratorCubit.state).thenReturn(const Initial());
      when(qrGeneratorCubit.getSeed()).thenAnswer((_) async {});

      ///Act
      await tester.pumpWidget(BlocProvider.value(
        value: qrGeneratorCubit,
        child: const MaterialApp(home: QrGeneratorPage()),
      ));

      await tester.tap(find.byKey(kPrimaryFloatingButton));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(kGenerateQrButton));
      await tester.pumpAndSettle();

      verify(qrGeneratorCubit.getSeed()).called(1);
    });
  });
}
