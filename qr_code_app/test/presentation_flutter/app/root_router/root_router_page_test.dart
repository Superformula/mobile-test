import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code_app/presentation_flutter/app/root_router/root_router_page.dart';

void main() {
  Widget homePage = Text("Home Page");
  Widget scannerPage = Text("Scanner Page");
  Widget qrCodePage = Text("Qr Code Page");

  Finder finderHomePage = find.byWidget(homePage);
  Finder finderQrCodePage = find.byWidget(qrCodePage);
  Finder finderScannerPage = find.byWidget(scannerPage);

  // Home Page

  testWidgets(
    'Shows Home Page initially',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildRootRouterPage(
          buildHomePage: (onQrCode, onScanner) => homePage,
        ),
      );

      expect(finderHomePage, findsOneWidget);
    },
  );

  // Qr Code Page

  testWidgets(
    'Home Page can route to Qr Code Page',
    (WidgetTester tester) async {
      Function onQrCodeTrigger;

      await tester.pumpWidget(
        buildRootRouterPage(
            buildHomePage: (onQrCode, onScanner) {
              onQrCodeTrigger = onQrCode;
              return homePage;
            },
            buildQrCodePage: (onBack) => qrCodePage),
      );

      onQrCodeTrigger();
      await tester.pumpAndSettle();

      expect(
        finderQrCodePage,
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'Qr Code Page can go back to Home Page',
        (WidgetTester tester) async {
      Function onQrCodeTrigger;
      Function onQrCodeBackTrigger;

      await tester.pumpWidget(
        buildRootRouterPage(
          buildHomePage: (onQrCode, onScanner) {
            onQrCodeTrigger = onQrCode;
            return homePage;
          },
          buildQrCodePage: (onBack) {
            onQrCodeBackTrigger = onBack;
            return qrCodePage;
          },
        ),
      );

      onQrCodeTrigger();
      await tester.pumpAndSettle();

      onQrCodeBackTrigger();
      await tester.pumpAndSettle();

      expect(
        finderHomePage,
        findsOneWidget,
      );
    },
  );

  // Scanner Page

  testWidgets(
    'Home Page can route to Scanner Page',
    (WidgetTester tester) async {
      Function onScannerTrigger;

      await tester.pumpWidget(
        buildRootRouterPage(
          buildHomePage: (onQrCode, onScanner) {
            onScannerTrigger = onScanner;
            return homePage;
          },
          buildScannerPage: (onBack) => scannerPage,
        ),
      );

      onScannerTrigger();
      await tester.pumpAndSettle();

      expect(
        finderScannerPage,
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'Scanner Page can go back to Home Page',
    (WidgetTester tester) async {
      Function onScannerTrigger;
      Function onScannerBackTrigger;

      await tester.pumpWidget(
        buildRootRouterPage(
          buildHomePage: (onQrCode, onScanner) {
            onScannerTrigger = onScanner;
            return homePage;
          },
          buildScannerPage: (onBack) {
            onScannerBackTrigger = onBack;
            return scannerPage;
          },
        ),
      );

      onScannerTrigger();
      await tester.pumpAndSettle();

      onScannerBackTrigger();
      await tester.pumpAndSettle();

      expect(
        finderHomePage,
        findsOneWidget,
      );
    },
  );
}

MaterialApp buildRootRouterPage({
  BuildHomePage buildHomePage,
  BuildQrCodePage buildQrCodePage,
  BuildScannerPage buildScannerPage,
}) {
  return MaterialApp(
    home: RootRouterPage(
      buildHomePage: buildHomePage,
      buildQrCodePage: buildQrCodePage,
      buildScannerPage: buildScannerPage,
    ),
  );
}
