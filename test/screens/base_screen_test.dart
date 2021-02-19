import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test/src/screens/base_screen.dart';

import 'pump_widget_mock_setup.dart';

void main() {
  testWidgets('Static elements display on load of home screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(const BaseScreenScaffold(
      title: 'Test Header',
      body: Text('Loading data'),
    )));
    expect(find.text('Loading data'), findsOneWidget);
    expect(find.text('Test Header'), findsOneWidget);
  });
}
