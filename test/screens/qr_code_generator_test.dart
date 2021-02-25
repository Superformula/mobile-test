import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test/src/custom_widgets/custom_countdown_timer.dart';
import 'package:mobile_test/src/screens/qr_code_generator.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../mock_set_up/test_setup.dart';
import '../model/seed_mock.dart';
import 'pump_widget_mock_setup.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  io.HttpOverrides.global = null;

  testWidgets('Test circular loader when no data loaded',
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      await dot_env.load();
      await tester.pumpWidget(buildTestableWidget(GenerateQRCodeScreen(
          qrCodeBloc: mockQRCodeGeneratorBloc(
              dataLoaded: false, dateTime: '2080-02-19T23:42:30.802Z'))));
      await tester.pump();
      expect(find.text('QRCODE'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Expires At: 2080-02-18T23:42:30.802Z'), findsNothing);
      expect(find.byType(QrImage), findsNothing);
      expect(find.byKey(const Key('no-qrLoaded')), findsOneWidget);
    });
  });
  testWidgets(
      'Test QR code with expiry date time/ QRCode/ refresh indicator/count down timer render properly',
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      await dot_env.load();
      await tester.pumpWidget(buildTestableWidget(GenerateQRCodeScreen(
          qrCodeBloc:
              mockQRCodeGeneratorBloc(dateTime: '2021-02-19T23:42:30.802Z'))));
      await tester.pumpAndSettle();
      expect(find.text('QRCODE'), findsOneWidget);
      expect(find.text('Expires At: 2080-02-18T23:42:30.802Z'), findsOneWidget);
      expect(find.byType(QrImage), findsOneWidget);
      expect(find.byType(CustomCountDownTimer), findsOneWidget);
      expect(find.byType(RefreshIndicator), findsOneWidget);
    });
  });

  testWidgets('QR code expires show expiry button',
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      await dot_env.load();
      await tester.pumpWidget(buildTestableWidget(GenerateQRCodeScreen(
          qrCodeBloc: mockQRCodeGeneratorBloc(
              dateTime: '2021-02-19T23:42:30.802Z',
              mockSeedData: mockSeedWithExpiredDate))));
      await tester.pumpAndSettle();
      expect(find.text('QRCODE'), findsOneWidget);
      expect(
          find.text('Expired pull down to refresh/tap button'), findsOneWidget);
      expect(find.byType(QrImage), findsOneWidget);
      expect(find.byType(RefreshIndicator), findsOneWidget);
    });
  });
}
