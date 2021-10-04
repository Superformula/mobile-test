import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seed_reader/routes/scan_seed/scan_seed_route.dart';
import '../../common/base_testable_widget.dart';

late ScanSeedRoute _route;
void main() {
  setUp(() {
    _route = const ScanSeedRoute();
  });
  testWidgets('#canHandle', (WidgetTester tester) async {
    expect(_route.canHandle('/foo'), false);
    expect(_route.canHandle('/scan_seed'), true);
  });
  testWidgets('#handle', (WidgetTester tester) async {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

    await tester.pumpWidget(
      BaseWidgetTest(
        navigatorKey: navigatorKey,
      ),
    );
    await tester.pumpAndSettle();

    navigatorKey.currentState?.push<dynamic>(
      _route.handle<dynamic>(
        const RouteSettings(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('hello world'), findsOneWidget);
  });
}
