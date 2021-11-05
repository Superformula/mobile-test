import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sf_qr_code/features/scan/scan_page.dart';

void main() {
  testWidgets('Scan page widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ScanPage()));
    expect(find.text('SCAN'), findsOneWidget);
      expect(find.text('Tap to scan'), findsOneWidget);
  });
}
