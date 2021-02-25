import 'dart:io' as io;

import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test/src/screens/qr_scanner.dart';

import '../mock_set_up/test_setup.dart';
import 'pump_widget_mock_setup.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  io.HttpOverrides.global = null;
  testWidgets('Test QR scanner render properly', (WidgetTester tester) async {
    await dot_env.load();
    await tester.pumpWidget(buildTestableWidget(QRCodeScannerScreen()));
    await tester.pumpAndSettle();
    expect(find.text('SCAN'), findsOneWidget);
  });

  testWidgets('Scanner test when no cameraResult', (WidgetTester tester) async {
    await dot_env.load();
    mockBarcodeScanner();
    await tester.pumpWidget(buildTestableWidget(QRCodeScannerScreen()));
    await tester.pumpAndSettle();
    expect(find.text('cameraResult is null'), findsOneWidget);
  });

  testWidgets('Scanned scans QR code', (WidgetTester tester) async {
    await dot_env.load();
    mockBarcodeScanner(qrCode: '2a6abu##2080-02-18T23:42:30.802Z');
    await tester.pumpWidget(buildTestableWidget(QRCodeScannerScreen()));
    await tester.pumpAndSettle();
    expect(find.text('Qr code scanned:\n2a6abu##2080-02-18T23:42:30.802Z'),
        findsOneWidget);
  });

  testWidgets('Scanned scans Expired QR code', (WidgetTester tester) async {
    await dot_env.load();
    mockBarcodeScanner(qrCode: '2a6abu##2012-02-18T23:42:30.802Z');
    await tester.pumpWidget(buildTestableWidget(QRCodeScannerScreen()));
    await tester.pumpAndSettle();
    expect(find.text('Qr code is not valid or expired, try again!'),
        findsOneWidget);
  });

  testWidgets('Exception is thrown when scanner sees issue',
      (WidgetTester tester) async {
    await dot_env.load();
    mockBarcodeScanner(
      exception: true,
    );
    await tester.pumpWidget(buildTestableWidget(QRCodeScannerScreen()));
    await tester.pumpAndSettle();
    expect(find.text('Unexpected error:'), findsOneWidget);
  });
}
