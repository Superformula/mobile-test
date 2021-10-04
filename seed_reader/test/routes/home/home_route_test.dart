import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seed_reader/routes/home/home_page.dart';
import 'package:seed_reader/routes/home/home_route.dart';
import '../../common/base_testable_widget.dart';

late HomeRoute _route;
void main() {
  setUp(() {
    _route = const HomeRoute();
  });
  testWidgets('#canHandle', (WidgetTester tester) async {
    expect(_route.canHandle('/foo'), false);
    expect(_route.canHandle('/home'), true);
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

    expect(find.byType(HomePage), findsOneWidget);
  });
}
