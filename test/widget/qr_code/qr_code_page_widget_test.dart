import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code/model/seed.dart';
import 'package:qr_code/redux/actions.dart';
import 'package:qr_code/redux/app_state.dart';

import '../../fixtures.dart';
import '../../widget_tester_extension.dart';

void main() {
  testWidgets(
      'WHEN QrCodePage is launched '
      'THEN it turns on auto refresh '
      'AND fetches a new seed', (WidgetTester tester) async {
    final spyStore = Fixtures.spyStore();

    await tester.pumpQrCodePage(spyStore);

    expect(spyStore.receivedActions, [TurnOnAutoRefreshAction(), FetchSeedAction()]);
  });

  testWidgets(
      'WHEN QrCodePage is disposed '
      'THEN it turns off auto refresh', (WidgetTester tester) async {
    final spyStore = Fixtures.spyStore();
    await tester.pumpQrCodePage(spyStore);

    await tester.disposeCurrentPage();

    expect(spyStore.receivedActions.last, TurnOffAutoRefreshAction());
  });

  testWidgets(
      'GIVEN app is loading a seed '
      'WHEN QrCodePage is displayed '
      'THEN a progress indicator is shown', (WidgetTester tester) async {
    final appState = Fixtures.appStateLoading();
    final store = Fixtures.store(initialState: appState);

    await tester.pumpQrCodePage(store);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets(
      'GIVEN AppState is in an invalid state '
      'WHEN QrCodePage is displayed '
      'THEN it shows an error message', (WidgetTester tester) async {
    final appState = AppState(
      seed: null,
      isLoadingSeed: false,
      fetchSeedFailed: false,
      validationState: ValidationState.idle(),
    );
    final store = Fixtures.store(initialState: appState);

    await tester.pumpQrCodePage(store);

    expect(find.text('Something wrong happened'), findsOneWidget);
  });

  testWidgets(
      'GIVEN AppState has "golden" seed '
      'WHEN QrCodePage is displayed '
      'THEN it shows a QR Code '
      'AND it matches the golden image', (WidgetTester tester) async {
    final appState = Fixtures.appStateWithGoldenSeed();
    final store = Fixtures.store(initialState: appState);

    await tester.pumpQrCodePage(store);

    await tester.findGoldenQrCode();
  });

  testWidgets(
      'GIVEN AppState has a valid seed '
      'WHEN QrCodePage is displayed '
      'THEN it shows a count down timer', (WidgetTester tester) async {
    final seed = Seed(value: 'seed', expiresAt: DateTime.now().add(Duration(seconds: 5)));
    final appState = Fixtures.appStateWithSeed(seed);
    final store = Fixtures.store(initialState: appState);

    await tester.pumpQrCodePage(store);

    expect(find.text('5 seconds'), findsOneWidget);
  });

  testWidgets(
      'GIVEN app failed to load a seed '
      'WHEN QrCodePage is displayed '
      'THEN it shows an error message '
      'AND a retry button', (WidgetTester tester) async {
    final appState = Fixtures.appStateWithFetchSeedFailed();
    final store = Fixtures.store(initialState: appState);

    await tester.pumpQrCodePage(store);

    expect(find.text('Something wrong happened'), findsOneWidget);
    expect(find.text('Try again'), findsOneWidget);
  });

  testWidgets(
      'GIVEN app failed to load a seed '
      'WHEN QrCodePage is displayed '
      'AND retry button is tapped '
      'THEN it fetches a new seed', (WidgetTester tester) async {
    final appState = Fixtures.appStateWithFetchSeedFailed();
    final spyStore = Fixtures.spyStore(initialState: appState);
    await tester.pumpQrCodePage(spyStore);

    await tester.tap(find.text('Try again'));

    // We need to receive two FetchSeed actions, one for when the page loads, and a second one when the retry button is tapped
    expect(spyStore.receivedActions, [TurnOnAutoRefreshAction(), FetchSeedAction(), FetchSeedAction()]);
  });
}
