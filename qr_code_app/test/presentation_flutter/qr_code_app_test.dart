import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:qr_code_app/presentation_flutter/qr_code_app.dart';

void main() {
  testWidgets(
    'App is a Material Design app',
    (WidgetTester tester) async {
      await showApp(tester);

      expect(
        find.byType(MaterialApp),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'Container is shown initially',
    (WidgetTester tester) async {
      await showApp(tester);

      expect(
        find.byType(Container),
        findsOneWidget,
      );
    },
  );
}

Future showApp(WidgetTester tester) async {
  await tester.pumpWidget(
    QrCodeApp(),
  );
}
