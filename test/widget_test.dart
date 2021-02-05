// This is a basic Flutter widget test.

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:qrGenerator/main.dart';

void main() {
  // for testing, the mock environment will be used
  registerDependencies(isProduction: false);

  group('QR Code widget tests', () {
    testWidgets('Launch app, finds FAB', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(QrCodeApp());

      // simple home screen test
      expect(find.byType(FabCircularMenu), findsOneWidget);
    });
  });
}
