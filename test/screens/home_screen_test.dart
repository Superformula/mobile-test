import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test/src/screens/home_screen.dart';

import '../utilities/navigator_util_test_mock.dart';
import 'pump_widget_mock_setup.dart';

void main() {
  testWidgets('Tap of floating action button trigger scanner and qr code icons',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(HomeScreen()));
    expect(find.byIcon(Icons.add), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.qr_code_scanner), findsOneWidget);
    expect(find.byIcon(Icons.qr_code), findsOneWidget);
  });

  testWidgets('Static elements display on home screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(HomeScreen()));
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.text('HOME'), findsOneWidget);
  });

  testWidgets('Tap of qr code icon renders next screen',
      (WidgetTester tester) async {
    mockNavigatorUtil();
    await tester.pumpWidget(buildTestableWidget(HomeScreen()));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.qr_code), findsOneWidget);
    await tester.tap(find.byIcon(Icons.qr_code));
    await tester.pumpAndSettle();
    expect(find.text('NEXT SCREEN'), findsOneWidget);
  });

  testWidgets('Tap of Scanner icon renders next screen',
      (WidgetTester tester) async {
    mockNavigatorUtil();
    await tester.pumpWidget(buildTestableWidget(HomeScreen()));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.qr_code_scanner), findsOneWidget);
    await tester.tap(find.byIcon(Icons.qr_code_scanner));
    await tester.pumpAndSettle();
    expect(find.text('NEXT SCREEN'), findsOneWidget);
  });
}
