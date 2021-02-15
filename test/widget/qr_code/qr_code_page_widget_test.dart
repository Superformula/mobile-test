import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code/redux/actions.dart';
import 'package:qr_code/redux/app_state.dart';
import 'package:qr_code/redux/reducers.dart';

import '../../fixtures.dart';
import '../../spies.dart';
import '../../widget_tester_extension.dart';

void main() {
  testWidgets(
      'WHEN QrCodePage is launched '
      'THEN it dispatches a FetchSeedAction', (WidgetTester tester) async {
    final spyStore = SpyStore(appReducer, initialState: AppState.init());

    await tester.pumpQrCodePage(spyStore);

    expect(spyStore.lastAction, FetchSeedAction());
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
    final appState = AppState(seed: null, isLoadingSeed: false);
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
}
