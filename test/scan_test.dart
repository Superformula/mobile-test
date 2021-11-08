import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:generator/scan_code/scan.dart';

void main() {
  testWidgets('finds a Widget', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ScanPage()));
    expect(find.byType(BarcodeScanner), findsOneWidget);
  });
}
