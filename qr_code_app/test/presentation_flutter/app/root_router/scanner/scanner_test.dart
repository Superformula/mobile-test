import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_app/presentation_flutter/app/intl/app_localizations.dart';
import 'package:qr_code_app/presentation_flutter/app/root_router/scanner/scanner_page.dart';

import '../../../util/custom_function.dart';
import '../../../util/custom_function_mock.dart';

Locale locale = Locale("en");

void main() {
  AppLocalizations appLocalizations = AppLocalizations(locale);

  Finder finderTitleText = find.text(appLocalizations.scanner);
  Finder finderBackButton = find.byIcon(Icons.arrow_back);

  // Title

  testWidgets(
    'Shows title',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildQrCodePage());

      expect(finderTitleText, findsOneWidget);
    },
  );

  // Back Button

  testWidgets(
    'Shows back button',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildQrCodePage());

      expect(finderBackButton, findsOneWidget);
    },
  );

  testWidgets(
    'Back button goes back',
        (WidgetTester tester) async {
      MockFunction onBack = MockFunction();

      await tester.pumpWidget(
        buildQrCodePage(
          onBack: onBack,
        ),
      );

      await tester.tap(finderBackButton);

      verify(onBack.call());
    },
  );
}

MaterialApp buildQrCodePage({
  CustomFunction onBack,
}) {
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocals,
    locale: locale,
    home: ScannerPage(
      onBack: () => onBack.call(),
    ),
  );
}