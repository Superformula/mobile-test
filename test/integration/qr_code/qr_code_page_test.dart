import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code/model/seed.dart';
import 'package:qr_code/qr_code/qr_code_page.dart';
import 'package:qr_code/redux/app_state.dart';
import 'package:qr_code/redux/reducers.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:redux/redux.dart';

void main() {
  testWidgets(
      'GIVEN app is loading a seed '
      'WHEN QrCodePage is displayed '
      'THEN a progress indicator is shown', (WidgetTester tester) async {
    final appState = AppState(
      seed: null,
      isLoadingSeed: true,
    );
    final store = Store<AppState>(
      appReducer,
      initialState: appState,
    );

    await tester.pumpWidget(StoreProvider(
        store: store,
        child: MaterialApp(
          home: QrCodePage(),
        )));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets(
      'GIVEN AppState is in an invalid state '
      'WHEN QrCodePage is displayed '
      'THEN it shows an error message', (WidgetTester tester) async {
    final appState = AppState(seed: null, isLoadingSeed: false);
    final store = Store<AppState>(
      appReducer,
      initialState: appState,
    );

    await tester.pumpWidget(StoreProvider(
        store: store,
        child: MaterialApp(
          home: QrCodePage(),
        )));

    expect(find.text('Something wrong happened'), findsOneWidget);
  });

  testWidgets(
      'GIVEN AppState has "golden" seed '
      'WHEN QrCodePage is displayed '
      'THEN it shows a QR Code '
      'AND it matches the golden image', (WidgetTester tester) async {
    final appState = AppState(seed: Seed(value: 'golden', expiresAt: DateTime(2100)), isLoadingSeed: false);
    final store = Store<AppState>(
      appReducer,
      initialState: appState,
    );

    await tester.pumpWidget(StoreProvider(
        store: store,
        child: MaterialApp(
          home: QrCodePage(),
        )));

    final qrCodeFinder = find.byType(QrImage);
    expect(qrCodeFinder, findsOneWidget);
    await expectLater(
      qrCodeFinder,
      matchesGoldenFile('./qr_image_golden.png'),
    );
  });
}
