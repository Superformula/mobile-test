import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_generator/presentation/qr_scanner/scanner_screen.dart';

import '../common/utils.dart';

void main() {
  group('$QRScannerScreen tests', () {
    late Widget widget;

    setUp(() => widget = makeTestableWidget(child: QRScannerScreen()));

    testWidgets('should contain expected widgets', (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      Finder title = find.text('QR Code');
      Finder qr = find.byType(QRView);

      expect(title, findsOneWidget);
      expect(qr, findsOneWidget);
    });
  });
}
