import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator/presentation/qr_generator/widgets/qr_view.dart';

import '../../common/utils.dart';

void main() {
  group('$QRView tests', () {
    late Widget widget;

    setUp(
      () => widget = makeTestableWidget(
        child: QRView(
          qrData: 'some QR',
          secondsToExpire: 10,
        ),
      ),
    );

    testWidgets(
      'should contain expected widgets',
      (WidgetTester tester) async {
        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();

        Finder qr = find.byType(QrImage);
        Finder timer = find.text('Expires in 10 second(s)...');

        expect(qr, findsOneWidget);
        expect(timer, findsOneWidget);
      },
    );
  });
}
