import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seed_reader/generated/l10n.dart';
import 'package:seed_reader/routes/home/home_page.dart';
import '../../../common/base_testable_widget.dart';

void main() {
  testWidgets('when taps in generate then should toggle actions visibility',
      (WidgetTester tester) async {
    void expectHidesActions(bool hides) {
      expect(
        find.text(S.current.homeActionGenerate),
        findsNWidgets(hides ? 0 : 1),
      );
      expect(
        find.text(S.current.scanPageTitle),
        findsNWidgets(hides ? 0 : 1),
      );
    }

    await tester.pumpComponent();

    await tester.openActions();
    expectHidesActions(false);

    await tester.closeActions();
    expectHidesActions(true);

    await tester.openActions();
    expectHidesActions(false);
  });
  testWidgets('when taps in scan then opens the route',
      (WidgetTester tester) async {
    await tester.pumpComponent();
    await tester.openActions();

    await tester.tap(find.text(S.current.homeActionScan));
    await tester.pumpAndSettle();
  });

  testWidgets('when taps in generate then opens the route',
      (WidgetTester tester) async {
    await tester.pumpComponent();
    await tester.openActions();

    await tester.tap(find.text(S.current.homeActionGenerate));
    await tester.pumpAndSettle();
  });
}

extension Pump on WidgetTester {
  Future<void> openActions() async {
    await tap(find.byIcon(Icons.add));
    await pumpAndSettle();
  }

  Future<void> closeActions() async {
    await tap(find.byIcon(Icons.close));
    await pumpAndSettle();
  }

  Future<void> pumpComponent() async {
    await pumpWidget(
      const BaseWidgetTest(
        child: HomePage(),
      ),
    );
    await pumpAndSettle();
  }
}
