import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code_app/presentation_flutter/app/intl/app_localizations.dart';
import 'package:qr_code_app/presentation_flutter/app/qr_code_app.dart';

void main() {
  Finder finderTitleText = find.text(AppLocalizations(Locale("en")).title);
  Finder finderMaterialApp = find.byType(MaterialApp);

  testWidgets(
    'App is a Material Design app',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        QrCodeApp(
          buildRootPage: (context) => Container(),
        ),
      );

      expect(
        finderMaterialApp,
        findsOneWidget,
      );
    },
  );

  // Poc, so does not have full locale switching + test
  testWidgets(
    'App uses localized strings',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        QrCodeApp(
          buildRootPage: (context) => Text(AppLocalizations.of(context).title),
        ),
      );

      expect(
        finderTitleText,
        findsOneWidget,
      );
    },
  );
}
