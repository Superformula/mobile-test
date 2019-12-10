import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code_app/presentation_flutter/intl/app_localizations.dart';
import 'package:qr_code_app/presentation_flutter/intl/strings_en.dart';

import 'package:qr_code_app/presentation_flutter/qr_code_app.dart';

void main() {
  testWidgets(
    'App is a Material Design app',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        QrCodeApp(
          buildRootPage: (context) => Container(),
        ),
      );

      expect(
        find.byType(MaterialApp),
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
        find.text(stringsEn['title']),
        findsOneWidget,
      );
    },
  );
}
