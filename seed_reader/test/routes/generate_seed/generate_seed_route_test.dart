import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seed_reader/routes/generate_seed/generate_seed_page.dart';
import 'package:seed_reader/routes/generate_seed/generate_seed_route.dart';
import '../../common/base_testable_widget.dart';

late GenerateSeedRoute _route;
void main() {
  setUp(() {
    _route = const GenerateSeedRoute();
  });
  testWidgets('#canHandle', (WidgetTester tester) async {
    expect(_route.canHandle('/foo'), false);
    expect(_route.canHandle('/generate_seed'), true);
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

    expect(find.byType(GenerateSeedPage), findsOneWidget);
  });
}
