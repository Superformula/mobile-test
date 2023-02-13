import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superformula_test/view/pages/home_page.dart';

void main() {
  testWidgets(
    'Should have the correct image logo',
    (tester) async {
      await pumpHomePage(tester);

      final superformulaLogoFinder = find.byType(Image);
      final superformulaLogoWidget =
          tester.widget<Image>(superformulaLogoFinder);

      expect(superformulaLogoFinder, findsOneWidget);
      expect(
        superformulaLogoWidget.image,
        const AssetImage('assets/superformula.jpeg'),
      );
    },
  );

  testWidgets(
    'Should have the correct texts',
    (tester) async {
      await pumpHomePage(tester);

      final textFinder = find.byType(Text);
      final textWidget = tester.widgetList<Text>(textFinder);

      expect(textFinder, findsNWidgets(2));
      expect(textWidget.first.data, equals('Superformula'));
      expect(textWidget.last.data, equals('Home'));
    },
  );

  testWidgets(
    'Should have the an AppBar with the correct title',
    (tester) async {
      await pumpHomePage(tester);

      final appBarFinder = find.byType(AppBar);
      final appBarWidget = tester.widget<AppBar>(appBarFinder);

      expect(appBarFinder, findsOneWidget);
      expect((appBarWidget.title as Text).data, equals('Home'));
    },
  );
}

Future<void> pumpHomePage(WidgetTester tester) async {
  await tester.pumpWidget(const MaterialApp(home: HomePage()));
  await tester.pumpAndSettle();
}
