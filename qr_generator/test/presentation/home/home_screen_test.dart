import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_generator/presentation/home/home_screen.dart';

import '../common/utils.dart';

void main() {
  group('$HomeScreen tests', () {
    late Widget widget;

    setUp(() => widget = makeTestableWidget(child: HomeScreen()));

    testWidgets('should contain expected widgets', (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      Finder title = find.text('Home');
      Finder fab = find.byType(SpeedDial);

      expect(title, findsOneWidget);
      expect(fab, findsOneWidget);
    });
  });
}
