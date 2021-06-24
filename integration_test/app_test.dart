import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator/injection.dart';
import 'package:qr_generator/presentation/core/app_widget.dart';
import 'package:qr_generator/presentation/home/home_page.dart';
import 'package:qr_generator/presentation/qr_code/qr_code_page.dart';
import 'package:qr_generator/presentation/scan/scan_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  testWidgets(
      "Tapping the FloatingAction button should display 2 more buttons " +
          "tapping the QR button should take the users to the QRPage ",
      (WidgetTester tester) async {
    await tester.pumpWidget(AppWidget());
    await tester.pumpAndSettle();
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.qr_code));
    await tester.pumpAndSettle();
    expect(find.byType(HomePage), findsNothing);
    expect(find.byType(QRCodePage), findsOneWidget);
    expect(find.byType(QrImage), findsOneWidget);
    expect(find.textContaining('seconds'), findsOneWidget);
  });

  testWidgets(
      "Tapping the FloatingAction button should display 2 more buttons " +
          "tapping the Camera button should take the users to the ScanPage ",
      (WidgetTester tester) async {
    await tester.pumpWidget(AppWidget());
    await tester.pumpAndSettle();
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.camera_alt));
    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsNothing);
    expect(find.byType(ScanPage), findsOneWidget);
    expect(find.byType(QRView), findsOneWidget);
    expect(find.text('Scan a code'), findsOneWidget);
  });

  testWidgets(
      "After navigating to any page, the user can always go back to the HomePage",
      (WidgetTester tester) async {
    await tester.pumpWidget(AppWidget());
    await tester.pumpAndSettle();
    // Display menu
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    // Go to QRPage
    await tester.tap(find.byIcon(Icons.qr_code));
    await tester.pumpAndSettle();
    // Go back to HomePage
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.byType(QRCodePage), findsNothing);
    expect(find.byType(HomePage), findsOneWidget);
    // Go to ScanPage
    await tester.tap(find.byIcon(Icons.camera_alt));
    await tester.pumpAndSettle();
    // Go back to HomePage
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.byType(ScanPage), findsNothing);
    expect(find.byType(HomePage), findsOneWidget);
  });
}
