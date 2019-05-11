import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supercode/widgets/home.dart';

void main() {
  group('HomeWidget', () {
    testWidgets('should render a FAB speed dial', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Home(
          navigateToScan: () {},
          navigateToQrCode: () {},
        ),
      ));

      expect(find.byType(SpeedDial), findsOneWidget);
      // 1 main FAB, 2 speed dial options
      expect(find.byType(FloatingActionButton), findsNWidgets(3));
    });
  });
}
