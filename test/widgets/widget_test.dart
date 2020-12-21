import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test/main.dart';
import 'package:mobile_test/src/bloc/qr_code_generator_bloc.dart';
import 'package:mobile_test/src/model/seed.dart';
import 'package:mobile_test/src/screens/qr_code_generator.dart';
import 'package:mobile_test/src/screens/qr_scanner.dart';
import 'package:mockito/mockito.dart';

import '../bloc/qr_code_generator_bloc_test.dart';
import '../model/seed_mock.dart';

void main() {
  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
          home: widget,
        ));
  }

  testWidgets('Tap of floating action button trigger scanner and qr code icons',
      (WidgetTester tester) async {
    await tester.pumpWidget(QRCodeGeneratorAndScannerApp());

    expect(find.byIcon(Icons.add), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.qr_code_scanner), findsOneWidget);
    expect(find.byIcon(Icons.qr_code), findsOneWidget);
  });

  testWidgets('Test QR code with expire Date render properly',
      (WidgetTester tester) async {
    MockSeedRepository mockSeedRepository = MockSeedRepository();
    when(mockSeedRepository.fetchSeed()).thenAnswer(
        (_) => Future<SeedResponse>.value(SeedResponse.fromJson(mockSeed)));
    final QRCodeGeneratorBloc qrCodeGeneratorBloc =
        QRCodeGeneratorBloc(seedRepository: mockSeedRepository);
    await tester.pumpWidget(buildTestableWidget(
        GenerateQRCodeScreen(qrCodeBloc: qrCodeGeneratorBloc)));
    await tester.pumpAndSettle();
    expect(find.text('QRCODE'), findsOneWidget);
    expect(find.text('Expires At: 10-20-2031'), findsOneWidget);
  });

  testWidgets('Test QR scanner render properly', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(QRCodeScannerScreen()));
    await tester.pumpAndSettle();
    expect(find.text('SCAN'), findsOneWidget);
  });
}
