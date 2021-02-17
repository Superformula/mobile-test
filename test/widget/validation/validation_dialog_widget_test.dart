import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code/redux/actions.dart';

import '../../fixtures.dart';
import '../../widget_tester_extension.dart';

void main() {
  testWidgets(
      'WHEN ValidationDialog is displayed '
      'THEN it validates the given code', (WidgetTester tester) async {
    final codeToValidate = 'golden';
    final spyStore = Fixtures.spyStore();

    await tester.pumpValidationDialog(codeToValidate: codeToValidate, store: spyStore);

    expect(spyStore.receivedActions, [ValidateQrCodeAction(codeToValidate)]);
  });

  testWidgets(
      'GIVEN app is validating a qr code '
      'WHEN ValidationDialog is displayed '
      'THEN a progress indicator is shown', (WidgetTester tester) async {
    final appState = Fixtures.appStateValidatingCode();
    final store = Fixtures.store(initialState: appState);

    await tester.pumpValidationDialog(store: store);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets(
      'GIVEN app has validated a qr code '
      'WHEN ValidationDialog is displayed '
      'THEN a success message is shown', (WidgetTester tester) async {
    final appState = Fixtures.appStateWithValidQrCode();
    final store = Fixtures.store(initialState: appState);

    await tester.pumpValidationDialog(store: store);

    expect(find.text("Good job! You've got a valid QR Code"), findsOneWidget);
  });

  testWidgets(
      'GIVEN app has an expired qr code '
      'WHEN ValidationDialog is displayed '
      'THEN an error message is shown', (WidgetTester tester) async {
    final appState = Fixtures.appStateWithExpiredQrCode();
    final store = Fixtures.store(initialState: appState);

    await tester.pumpValidationDialog(store: store);

    expect(find.text("This QR Code has expired. Try a new one"), findsOneWidget);
  });

  testWidgets(
      'GIVEN ValidationDialog is displayed '
      "WHEN there's an error validating the qr code "
      'THEN an error message and a retry button are shown', (WidgetTester tester) async {
    final appState = Fixtures.appStateWithValidateQrCodeFailed();
    final store = Fixtures.store(initialState: appState);

    await tester.pumpValidationDialog(store: store);

    expect(find.text("Something wrong happened"), findsOneWidget);
    expect(find.text("Try again"), findsOneWidget);
  });

  testWidgets(
      'GIVEN ValidationDialog is displayed '
      'AND app has failed to validate qr code '
      "WHEN retry button is tapped "
      'THEN it dispatches a ValidateQrCodeAction', (WidgetTester tester) async {
    final codeToValidate = 'golden';
    final appState = Fixtures.appStateWithValidateQrCodeFailed();
    final spyStore = Fixtures.spyStore(initialState: appState);

    await tester.pumpValidationDialog(codeToValidate: codeToValidate, store: spyStore);

    await tester.tap(find.text("Try again"));

    // We need to receive two actions, one for when the dialog loads, and a second one when the retry button is tapped
    expect(spyStore.receivedActions, [ValidateQrCodeAction(codeToValidate), ValidateQrCodeAction(codeToValidate)]);
  });
}
