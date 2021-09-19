import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_generator/presentation/qr_generator/generator_screen.dart';

import '../common/utils.dart';

void main() {
  group('$QRGeneratorScreen tests', () {
    late Widget widget;

    setUp(() => widget = makeTestableWidget(child: QRGeneratorScreen()));

    // TODO should implement dependency injection to inject the cubits into
    // screens so mocking/testing different states is easier.
    testWidgets(
      'should contain expected widgets',
      (WidgetTester tester) async {
        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();

        Finder title = find.text('QR Code');

        expect(title, findsOneWidget);
      },
    );
  });
}
