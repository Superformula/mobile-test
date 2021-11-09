import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_generator/screens/home_view/home_view.dart';

void main() {
  testWidgets('Home screen test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
          home: HomeView(),
        ),
      ),
    );
    await tester.pump(Duration.zero);
    expect(find.byType(SpeedDial), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
  });
}
