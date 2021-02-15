import 'package:flutter_test/flutter_test.dart';

import '../../widget_tester_extension.dart';

void main() {
  testWidgets(
      'GIVEN HomePage is displayed '
      'WHEN "QR Code" button is clicked '
      'THEN QrCodePage is displayed', (WidgetTester tester) async {
    await tester.pumpHomePage();

    await tester.tap(find.text('QR Code'));
    await tester.settleNavigation();

    expect(find.text('Home'), findsNothing);
    expect(find.text('QR Code'), findsOneWidget);
  });

  testWidgets(
      'GIVEN HomePage is displayed '
      'WHEN "Scan" button is clicked '
      'THEN ScanPage is displayed', (WidgetTester tester) async {
    await tester.pumpHomePage();

    await tester.tap(find.text('Scan'));
    await tester.settleNavigation();

    expect(find.text('Home'), findsNothing);
    expect(find.text('Scan'), findsOneWidget);
  });
}
