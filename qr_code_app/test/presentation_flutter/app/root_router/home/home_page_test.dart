import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_app/presentation_flutter/app/intl/app_localizations.dart';
import 'package:qr_code_app/presentation_flutter/app/root_router/home/home_page.dart';

import '../../../util/custom_function.dart';
import '../../../util/custom_function_mock.dart';


Locale locale = Locale("en");

void main() {
  AppLocalizations appLocalizations = AppLocalizations(locale);

  Finder finderMenuButton = find.byType(FloatingActionButton).at(2);

  Finder finderTitleText = find.text(appLocalizations.title);

  Finder finderScannerText = find.text(appLocalizations.scanner);
  Finder finderScannerIcon = find.byIcon(Icons.photo_camera);

  Finder finderQrCodeText = find.text(appLocalizations.qrCode);
  Finder finderQrCodeIcon = find.byIcon(Icons.image);

  // Title

  testWidgets(
    'Shows title',
    (WidgetTester tester) async {
      await tester.pumpWidget(buildHomePage(null, null));

      expect(finderTitleText, findsOneWidget);
    },
  );

  // Menu Button

  testWidgets(
    'Shows menu button',
    (WidgetTester tester) async {
      await tester.pumpWidget(buildHomePage(null, null));

      expect(finderMenuButton, findsOneWidget);
    },
  );

  testWidgets(
    'Tapping menu button when contracted shows scanner and qr code buttons',
    (WidgetTester tester) async {
      await tester.pumpWidget(buildHomePage(null, null));

      await tester.tap(finderMenuButton);
      await tester.pumpAndSettle();

      expect(finderScannerText, findsOneWidget);
      expect(finderScannerIcon, findsOneWidget);
      expect(finderQrCodeText, findsOneWidget);
      expect(finderQrCodeIcon, findsOneWidget);
    },
  );

  testWidgets(
    'Tapping menu button when expanded hides scanner and qr code buttons',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildHomePage(null, null),
      );

      await tester.tap(finderMenuButton);
      await tester.pumpAndSettle();

      await tester.tap(finderMenuButton);
      await tester.pumpAndSettle();

      expect(finderScannerIcon, findsNothing);
      expect(finderScannerText, findsNothing);
      expect(finderQrCodeIcon, findsNothing);
      expect(finderQrCodeText, findsNothing);
    },
  );

  // Scanner Button

  testWidgets(
    'Tapping scanner icon triggers onScan function',
    (WidgetTester tester) async {
      MockFunction onScan = MockFunction();

      await tester.pumpWidget(buildHomePage(null, onScan));

      await tester.tap(finderMenuButton);
      await tester.pumpAndSettle();

      await tester.tap(finderScannerIcon);

      verify(onScan.call());
    },
  );

  testWidgets(
    'Tapping scanner text triggers onScan function',
    (WidgetTester tester) async {
      MockFunction onScan = MockFunction();

      await tester.pumpWidget(buildHomePage(null, onScan));

      await tester.tap(finderMenuButton);
      await tester.pumpAndSettle();

      await tester.tap(finderScannerText);

      verify(onScan.call());
    },
  );

  // Qr Code Button

  testWidgets(
    'Tapping qr code icon triggers onQrCode function',
    (WidgetTester tester) async {
      MockFunction onQrCode = MockFunction();

      await tester.pumpWidget(buildHomePage(onQrCode, null));

      await tester.tap(finderMenuButton);
      await tester.pumpAndSettle();

      await tester.tap(finderQrCodeIcon);

      verify(onQrCode.call());
    },
  );

  testWidgets(
    'Tapping qr code text triggers onQrCode function',
    (WidgetTester tester) async {
      MockFunction onQrCode = MockFunction();

      await tester.pumpWidget(buildHomePage(onQrCode, null));

      await tester.tap(finderMenuButton);
      await tester.pumpAndSettle();

      await tester.tap(finderQrCodeText);

      verify(onQrCode.call());
    },
  );
}

MaterialApp buildHomePage(
  CustomFunction onQrCode,
  CustomFunction onScan,
) {
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocals,
    locale: locale,
    home: HomePage(
      onQrCode: () => onQrCode.call(),
      onScan: () => onScan.call(),
    ),
  );
}
