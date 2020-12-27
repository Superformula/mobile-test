import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superformula_challenge/screens/screens.dart';

void main() {
  testWidgets('Speed dial is shown with two options', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Dashboard(),
      ),
    );

    Finder speedDialFinder = find.byType(SpeedDial);
    expect(speedDialFinder, findsOneWidget);

    // SpeedDialChild renders as additional FloatingActionButton
    Finder speedDialChildFinder = find.byType(FloatingActionButton);
    expect(speedDialChildFinder, findsNWidgets(3));
  });
}
