import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code/home/home_page.dart';

import '../../fixtures.dart';

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

extension _HomePageTestHelpers on WidgetTester {
  Future pumpHomePage() async {
    await pumpWidget(
      StoreProvider(
        store: Fixtures.buildStore(),
        child: MaterialApp(home: HomePage()),
      ),
    );
  }

  Future settleNavigation() async {
    await pump();
    await pump(const Duration(seconds: 3));
  }
}
