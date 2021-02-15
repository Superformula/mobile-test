import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code/redux/store.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../widget_tester_extension.dart';

void main() {
  // TODO - Inject mock api client in the test below
  // At the moment we know the api client eventually
  // returns the golden seed, but this should change soon
  testWidgets(
      'WHEN QrCodePage is displayed '
      'THEN it shows a progress indicator '
      'AND a QR Code', (WidgetTester tester) async {
    final store = createReduxStore();
    await tester.pumpQrCodePage(store);

    expect(find.text('QR Code'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byType(QrImage), findsOneWidget);
  });
}
