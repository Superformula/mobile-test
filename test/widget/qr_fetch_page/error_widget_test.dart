import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code_test/routes/qr_fetch_page/error_widget.dart';

void main() {
  group("Rendering tests for the 'QRErrorWidget' widget", () {
    testWidgets("Making sure the widget shows hours, minutes and seconds when "
        "all of these time units are greater than zero.", (tester) async {

      await tester.pumpWidget(MaterialApp(
        home: const QRErrorWidget(),
      ));

      // The default error message
      expect(find.text("Something went wrong!"), findsOneWidget);
      expect(find.byType(Divider), findsOneWidget);
      expect(find.byType(Icon), findsNWidgets(2));
    });
  });
}