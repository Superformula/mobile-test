import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code_app/presentation_flutter/app/root_router/root_router_page.dart';

void main() {
  testWidgets(
    'Shows Home Page initially',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: RootRouterPage(
            buildHomePage: () => Text("Home Page"),
          ),
        ),
      );

      expect(
        find.text("Home Page"),
        findsOneWidget,
      );
    },
  );
}
