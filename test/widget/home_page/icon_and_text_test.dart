import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code_test/routes/home_page/icon_and_text.dart';

void main() {
  group("Rendering tests for the 'IconAndText' widget", () {
    testWidgets("Making sure the widget is correctly rendered", (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: const IconAndText(
          icon: Icon(Icons.check),
          text: "Test",
        )
      ));

      // Body
      expect(find.byType(Icon), findsOneWidget);
      expect(find.text("Test"), findsOneWidget);
    });
  });
}