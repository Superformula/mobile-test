// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:sftest_flutter/main.dart';

void main() {
  testWidgets('Initial UI component validation', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byType(SpeedDial), findsOneWidget);

    await tester.tap(find.byType(SpeedDial));
  });
}
