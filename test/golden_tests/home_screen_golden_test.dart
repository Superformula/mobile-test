import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mobile_test/src/screens/home_screen.dart';

void main() {
  group('Golden Test: Home screen elements render properly', () {
    testGoldens('Home screen elements renders properly',
        (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidgetBuilder(
          Container(
            height: 300,
            width: 200,
            child: HomeScreen(),
          ),
          surfaceSize: const Size(200, 300),
          wrapper: materialAppWrapper(
              theme: ThemeData.light(), platform: TargetPlatform.android));
      await screenMatchesGolden(tester, 'home_screen_golden');
    });
  });

  group('Golden Test: Menu Items elements render properly', () {
    testGoldens('Menu Items elements renders properly',
        (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidgetBuilder(
          Container(
            height: 300,
            width: 200,
            child: HomeScreen(),
          ),
          surfaceSize: const Size(200, 300),
          wrapper: materialAppWrapper(
              theme: ThemeData.light(), platform: TargetPlatform.android));
      await tester.tap(find.byIcon(Icons.add));
      await screenMatchesGolden(tester, 'menu_items_golden');
    });
  });
}
