import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test/src/customWidgets/custom_countdown_timer.dart';

import '../screens/pump_widget_mock_setup.dart';

void main() {
  testWidgets('Count down timer shows remaining time',
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester
          .pumpWidget(buildTestableWidget(const CustomCountDownTimer(30)));
      expect(find.text('29 s'), findsOneWidget);
    });
  });

  testWidgets('count down timer shows expired', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester
          .pumpWidget(buildTestableWidget(const CustomCountDownTimer(0)));
      expect(find.text('Qr code expired try another'), findsOneWidget);
      expect(find.byType(FlatButton), findsOneWidget);
    });
  });
}
