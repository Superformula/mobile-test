import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:superformula_test/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    'tap on the FAB',
    () {
      testWidgets(
        'should open the extended menu (a SizedBox with width equals to 150) and then close the extended menu (a SizedBox with width equals to 0)',
        (widgetTester) async {
          app.main();

          await widgetTester.pumpAndSettle();

          final fabFinder = find.byType(FloatingActionButton);

          // Open
          await widgetTester.tap(fabFinder);
          await widgetTester.pumpAndSettle();

          final sizedBoxFinder = find.byType(SizedBox);
          final sizedBoxWidget =
              widgetTester.widgetList<SizedBox>(sizedBoxFinder);

          expect(sizedBoxWidget.first.width, equals(150));

          // Close
          await widgetTester.tap(fabFinder);
          await widgetTester.pumpAndSettle();

          final sizedBoxFinder2 = find.byType(SizedBox);
          final sizedBoxWidget2 =
              widgetTester.widgetList<SizedBox>(sizedBoxFinder2);

          expect(sizedBoxWidget2.first.width, equals(0));
        },
      );
    },
  );
}
