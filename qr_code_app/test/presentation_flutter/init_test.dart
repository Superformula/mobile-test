import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code_app/presentation_flutter/init.dart';

void main() {
  testWidgets(
    'Container is shown as root page',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        createApp(),
      );

      expect(
        find.byType(Container),
        findsOneWidget,
      );
    },
  );
}
