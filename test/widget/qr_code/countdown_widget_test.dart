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

  testWidgets(
      'WHEN CountDownWidget is displayed '
      'AND time left is one second '
      'THEN it shows the correct value', (WidgetTester tester) async {
    final endTime = DateTime.now().add(Duration(seconds: 1)).millisecondsSinceEpoch;

    await tester.pumpWidget(MaterialApp(home: CountdownWidget(endTime: endTime)));

    expect(find.text('1 second'), findsOneWidget);
  });

  testWidgets(
      'WHEN CountDownWidget is displayed '
      'AND time left is greater than 59 seconds '
      'THEN it shows the correct value in seconds', (WidgetTester tester) async {
    final endTime = DateTime.now().add(Duration(days: 1, hours: 4, minutes: 2, seconds: 30)).millisecondsSinceEpoch;

    await tester.pumpWidget(MaterialApp(home: CountdownWidget(endTime: endTime)));

    expect(find.text('100950 seconds'), findsOneWidget);
  });
}
