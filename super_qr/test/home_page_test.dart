import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:super_qr/main.dart';

void main() {
  testWidgets('Home page smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Application());

    // Verify that we are on the home screen
    // expect(find.text('A QR code consists of black squares'), findsOneWidget);
    expect(find.text('Super QR'), findsOneWidget);

    // Tap the FAB icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that we see menu buttons.
    expect(find.text('Scan QR Code'), findsOneWidget);
    expect(find.text('View a QR Code'), findsOneWidget);
  });

  // TODO: Navigate to QR Display test

  // TODO: Scan QR Code test
}
