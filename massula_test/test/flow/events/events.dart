import 'package:flutter_test/flutter_test.dart';
import 'package:massula_test/pages/home.dart';

Future<void> tapOnHomeFAB(WidgetTester tester) async {
  final homeFAB = find.byKey(homeFloatingActionButtonKey, skipOffstage: false);
  expect(homeFAB, findsOneWidget);
  await tester.ensureVisible(homeFAB);
  return tester.tap(homeFAB);
}

Future<void> tapOnQRCodeButton(WidgetTester tester) async {
  final qrCodeButton = find.byKey(goToQRCodePageButtonKey);
  expect(qrCodeButton, findsOneWidget);
  await tester.ensureVisible(qrCodeButton);
  return tester.tap(qrCodeButton);
}