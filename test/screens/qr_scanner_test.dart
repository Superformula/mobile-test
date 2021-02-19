import 'dart:io' as io;

import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test/src/screens/qr_scanner.dart';

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
}
