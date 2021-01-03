import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code_test/routes/qr_validation_page/validation_alert.dart';

void main() {
  group("Rendering tests for the 'ValidationAlert' widget", () {
    testWidgets("Making sure the widget is correctly rendered in case of "
        "successful validation", (tester) async {
      await tester.pumpWidget(MaterialApp(
          home: const ValidationAlert(
            success: true,
            message: "Success!",
          )
      ));

      // Body
      expect(find.text("Success!"), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);

      expect(find.byWidget(const Icon(Icons.warning,
        color: Colors.redAccent,
        size: 80,
      )), findsNothing);
    });

    testWidgets("Making sure the widget is correctly rendered in case of "
        "failed validation", (tester) async {
      await tester.pumpWidget(MaterialApp(
          home: const ValidationAlert(
            success: false,
            message: "Failure!",
          )
      ));

      // Body
      expect(find.text("Failure!"), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);

      expect(find.byWidget(const Icon(Icons.check_circle,
        color: Colors.green,
        size: 80,
      )), findsNothing);
    });
  });
}