import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code_test/routes/home_page/home_body.dart';

void main() {
  group("Home page body widget rendering tests", () {
    testWidgets("Making sure the page is correctly rendered", (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: const Scaffold(
          body: HomeBody(),
        ),
      ));

      // Body
      expect(find.byType(RaisedButton), findsNWidgets(2));
      expect(find.text("Fetch QR"), findsOneWidget);
      expect(find.text("Scan QR"), findsOneWidget);
    });
  });
}