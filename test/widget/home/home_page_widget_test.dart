import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../widget_tester_extension.dart';

void main() {
  testWidgets(
      'GIVEN HomePage is displayed '
      'WHEN "QR Code" button is clicked '
      'THEN QrCodePage is displayed', (WidgetTester tester) async {
    await tester.pumpHomePage();

    await tester.tap(find.byType(SpeedDial));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.qr_code));
    await tester.settleNavigation();

    expect(find.text('Home'), findsNothing);
    expect(find.text('QR Code'), findsOneWidget);
  });

  testWidgets(
      'GIVEN HomePage is displayed '
      'WHEN "Scan" button is clicked '
      'THEN ScanPage is displayed', (WidgetTester tester) async {
    await tester.pumpHomePage();

    await tester.tap(find.byType(SpeedDial));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.fit_screen));
    await tester.settleNavigation();

    expect(find.text('Home'), findsNothing);
    expect(find.text('Scan'), findsOneWidget);
  });
}
