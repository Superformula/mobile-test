import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures.dart';
import '../../widget_tester_extension.dart';

void main() {
  testWidgets(
      'GIVEN app is validating a qr code '
      'WHEN ValidationDialog is displayed '
      'THEN a progress indicator is shown', (WidgetTester tester) async {
    final appState = Fixtures.appStateValidatingCode();
    final store = Fixtures.store(initialState: appState);

    await tester.pumpValidationDialog(store);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets(
      'GIVEN app has validated a qr code '
      'WHEN ValidationDialog is displayed '
      'THEN a success message is shown', (WidgetTester tester) async {
    final appState = Fixtures.appStateWithValidQrCode();
    final store = Fixtures.store(initialState: appState);

    await tester.pumpValidationDialog(store);

    expect(find.text("Good job! You've got a valid QR Code"), findsOneWidget);
  });

  testWidgets(
      'GIVEN app has an expired qr code '
      'WHEN ValidationDialog is displayed '
      'THEN an error message is shown', (WidgetTester tester) async {
    final appState = Fixtures.appStateWithExpiredQrCode();
    final store = Fixtures.store(initialState: appState);

    await tester.pumpValidationDialog(store);

    expect(find.text("This QR Code has expired. Try a new one"), findsOneWidget);
  });

  testWidgets(
      'GIVEN ValidationDialog is displayed '
      "WHEN there's an error validating the qr code "
      'THEN an error message and a retry button are shown', (WidgetTester tester) async {
    final appState = Fixtures.appStateWithValidateQrCodeFailed();
    final store = Fixtures.store(initialState: appState);

    await tester.pumpValidationDialog(store);

    expect(find.text("Something wrong happened"), findsOneWidget);
    expect(find.text("Try again"), findsOneWidget);
  });
}
