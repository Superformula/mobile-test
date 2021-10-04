import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seed_reader/generated/l10n.dart';
import 'package:seed_reader/routes/app_route.dart';
import 'package:seed_reader/routes/generate_seed/generate_seed_page.dart';
import 'package:seed_reader/routes/generate_seed/generate_seed_route.dart';
import 'package:seed_reader/routes/home/home_page.dart';
import 'package:seed_reader/routes/scan_seed/scan_seed_page.dart';
import 'package:seed_reader/routes/scan_seed/scan_seed_route.dart';
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
  testWidgets('when taps in scan action then opens the route',
      (WidgetTester tester) async {
    await tester.pumpComponent();
    await tester.openActions();

    await tester.tap(find.text(S.current.homeActionScan));
    await tester.pumpAndSettle();

    expect(find.byType(ScanSeedPage), findsOneWidget);
  });

  testWidgets('when taps in generate action then opens the route',
      (WidgetTester tester) async {
    await tester.pumpComponent();
    await tester.openActions();

    await tester.tap(find.text(S.current.homeActionGenerate));
    await tester.pumpAndSettle();

    expect(find.byType(GenerateSeedPage), findsOneWidget);
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
        routes: <AppRoute>[
          ScanRoute(),
          GenerateSeedRoute(),
        ],
        child: HomePage(),
      ),
    );
    await pumpAndSettle();
  }
}
