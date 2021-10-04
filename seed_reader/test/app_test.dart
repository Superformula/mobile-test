import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seed_reader/app.dart';
import 'package:seed_reader/routes/home/home_page.dart';

void main() {
  testWidgets('render components', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(BackButton), findsNothing);
  });
}
