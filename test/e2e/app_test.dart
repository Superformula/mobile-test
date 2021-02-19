import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:qr_code/main.dart' as app;
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('app shows a QR code', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    await tapQrCodeButton(tester);
    await tester.pumpAndSettle();

    expect(find.text("QR Code"), findsOneWidget);
    expect(find.byType(QrImage), findsOneWidget);
  });
}

Future tapQrCodeButton(WidgetTester tester) async {
  await tester.tap(find.byType(SpeedDial));
  await tester.pumpAndSettle();

  await tester.tap(find.byIcon(Icons.qr_code));
}
