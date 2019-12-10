import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code_app/presentation_flutter/app/intl/app_localizations.dart';
import 'package:qr_code_app/presentation_flutter/app/intl/strings_en.dart';
import 'package:qr_code_app/presentation_flutter/app/root_router/home/home_page.dart';

void main() {
  testWidgets(
    'Shows title',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocals,
          home: HomePage(),
        ),
      );

      expect(
        find.text(stringsEn['title']),
        findsOneWidget,
      );
    },
  );
}
