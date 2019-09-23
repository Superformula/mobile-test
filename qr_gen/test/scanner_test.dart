import 'package:flutter_test/flutter_test.dart';
import 'package:qr_gen/core/services/scan.dart';

import 'util/locator.dart';
import 'util/wrapper.dart';
import 'package:qr_gen/ui/screens/scanner.dart';

void main() {
  group('Scanner screen', () {
    testWidgets('Renders successful scan', (WidgetTester tester) async {
      setupLocator();

      // Build our app and trigger a frame.
      await tester.pumpWidget(TestWrapper(ScannerScreen()));
      await tester.pump(Duration.zero);

      // Verify that our counter starts at 0.
      expect(find.text('Scanned successfully'), findsOneWidget);
      expect(
          find.text('Seed: 9b0a34057c9d302628e1d7ef50e37b08'), findsOneWidget);
    });

    testWidgets('Renders error on ScanServiceErrorCode.CameraAccessDenied',
        (WidgetTester tester) async {
      setupErrorLocator(ScanServiceErrorCode.CameraAccessDenied);

      // Build our app and trigger a frame.
      await tester.pumpWidget(TestWrapper(ScannerScreen()));
      await tester.pump(Duration.zero);

      // Verify that our counter starts at 0.
      expect(find.text('Issue with scan'), findsOneWidget);
      expect(find.text('You did not grant the camera permission!'),
          findsOneWidget);
    });

    testWidgets('Renders error on ScanServiceErrorCode.Format',
        (WidgetTester tester) async {
      setupErrorLocator(ScanServiceErrorCode.Format);

      // Build our app and trigger a frame.
      await tester.pumpWidget(TestWrapper(ScannerScreen()));
      await tester.pump(Duration.zero);

      // Verify that our counter starts at 0.
      expect(find.text('Issue with scan'), findsOneWidget);
      expect(find.text('You cancelled the scan!'), findsOneWidget);
    });

    testWidgets('Renders error on ScanServiceErrorCode.Unknown',
        (WidgetTester tester) async {
      setupErrorLocator(ScanServiceErrorCode.Unknown);

      // Build our app and trigger a frame.
      await tester.pumpWidget(TestWrapper(ScannerScreen()));
      await tester.pump(Duration.zero);

      // Verify that our counter starts at 0.
      expect(find.text('Issue with scan'), findsOneWidget);
      expect(find.text('Unknown error: '), findsOneWidget);
    });
  });
}
