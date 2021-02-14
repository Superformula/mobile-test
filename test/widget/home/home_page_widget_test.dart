import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code/home/home_page.dart';

void main() {
  testWidgets(
      'GIVEN HomePage is displayed '
      'WHEN "QR Code" button is clicked '
      'THEN QrCodePage is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    await tester.tap(find.text('QR Code'));
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsNothing);
    expect(find.text('QR Code'), findsOneWidget);
  });

  testWidgets(
      'GIVEN HomePage is displayed '
      'WHEN "Scan" button is clicked '
      'THEN ScanPage is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    await tester.tap(find.text('Scan'));
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsNothing);
    expect(find.text('Scan'), findsOneWidget);
  });
}
