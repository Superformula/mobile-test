import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mobile_test/src/screens/base_screen.dart';

void main() {
  group('Golden Test: Base screen elements render properly', () {
    testGoldens('Base screen elements renders properly',
        (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidgetBuilder(
          Container(
            height: 300,
            width: 200,
            child: BaseScreenScaffold(
              title: 'Base',
              body: Container(
                height: 100,
                color: Colors.purple,
              ),
            ),
          ),
          surfaceSize: const Size(200, 300),
          wrapper: materialAppWrapper(
              theme: ThemeData.light(), platform: TargetPlatform.android));
      await screenMatchesGolden(tester, 'base_screen_golden');
    });
  });
}
