import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:superformula_leandro/core/constants/strings_constants.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/pages/home/home_page.dart';

import '../../../mocks/mocktail.dart';

void main() {
  group('HomePage |', () {
    late final MockNavigatorObserver mockObserver;
    setUpAll(() {
      mockObserver = MockNavigatorObserver();
      registerFallbackValue(MockRoute());
    });
    Future<void> pumpWidget(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const HomePage(),
          navigatorObservers: [mockObserver],
        ),
      );
    }

    testWidgets('HomePage should display app bar and speed dial',
        (WidgetTester tester) async {
      await pumpWidget(tester);
      await tester.pumpAndSettle();

      expect(find.text(StringsConstants.home), findsOneWidget);
      expect(find.byType(SpeedDial), findsOneWidget);
    });

    testWidgets(
        'should tap the Icons.camera_alt_outlined and navigate correctly',
        (WidgetTester tester) async {
      await pumpWidget(tester);
      await tester.pumpAndSettle();

      final speedDialFinder = find.byType(SpeedDial);
      expect(speedDialFinder, findsOneWidget);
      final speedDialWidget = tester.widget<SpeedDial>(speedDialFinder);
      expect(speedDialWidget.children.length, equals(2));

      await tester.tap(speedDialFinder);
      await tester.pump();

      await tester.tap(find.byIcon(Icons.camera_alt_outlined));
      await tester.pumpAndSettle();
      verify(
        () => mockObserver.didPush(any(), any()),
      );
    });

    testWidgets(
        'should tap the Icons.qr_code_scanner_rounded and navigate correctly',
        (WidgetTester tester) async {
      await pumpWidget(tester);
      await tester.pumpAndSettle();

      final speedDialFinder = find.byType(SpeedDial);
      expect(speedDialFinder, findsOneWidget);
      final speedDialWidget = tester.widget<SpeedDial>(speedDialFinder);
      expect(speedDialWidget.children.length, equals(2));

      await tester.tap(speedDialFinder);
      await tester.pump();

      await tester.tap(find.byIcon(Icons.qr_code_scanner_rounded));
      await tester.pumpAndSettle();
      verify(() => mockObserver.didPush(any(), any()));
    });
  });
}
