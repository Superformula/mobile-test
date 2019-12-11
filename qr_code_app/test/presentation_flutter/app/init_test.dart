import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code_app/init.dart';
import 'package:qr_code_app/presentation_flutter/app/root_router/root_router_page.dart';

void main() {
  testWidgets(
    'Root Router Page is shown as root page',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        createApp(),
      );

      expect(
        find.byType(RootRouterPage),
        findsOneWidget,
      );
    },
  );
}
