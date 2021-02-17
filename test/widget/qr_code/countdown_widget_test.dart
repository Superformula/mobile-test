import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code/qr_code/countdown_widget.dart';

void main() {
  testWidgets(
      'WHEN CountDownWidget is displayed '
      'THEN it counts down time', (WidgetTester tester) async {
    final endTime = DateTime.now().add(Duration(seconds: 5)).millisecondsSinceEpoch;

    await tester.pumpWidget(MaterialApp(home: CountdownWidget(endTime: endTime)));

    expect(find.text('5 seconds'), findsOneWidget);
  });
}
