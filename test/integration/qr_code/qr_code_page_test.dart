import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code/redux/api_middleware.dart';
import 'package:qr_code/redux/store.dart';

import '../../mocks.dart';
import '../../widget_tester_extension.dart';

void main() {
  // TODO - Inject mock api client in the tests below
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

    await tester.findGoldenQrCode();

    // Dispose the page and wait for futures to complete
    await tester.disposeCurrentPage();
    await tester.pump(Duration(seconds: 30));
  });

  testWidgets(
      'GIVEN QrCodePage is displayed '
      'WHEN the seed expires '
      'THEN it loads a new seed', (WidgetTester tester) async {
    final store = createReduxStore();
    await tester.pumpQrCodePage(store);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    await tester.findGoldenQrCode();

    await tester.pump(Duration(seconds: 15)); // Right now this needs to match the seed returned by the ApiClient

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    await tester.findGoldenQrCode();

    // Dispose the page and wait for futures to complete
    await tester.pumpWidget(Container());
    await tester.pump(Duration(seconds: 30));
  });

  testWidgets(
      'GIVEN QrCodePage is displayed '
      'WHEN fetch seed fails '
      'THEN it shows error message', (WidgetTester tester) async {
    final apiClient = ApiClientMock();
    when(apiClient.fetchSeed()).thenAnswer((_) => Future.error(Exception()));

    final store = createReduxStore(middleware: [ApiMiddleware(apiClient)]);

    await tester.pumpQrCodePage(store);
    await tester.pumpAndSettle();

    expect(find.text('Something wrong happened'), findsOneWidget);
    expect(find.text('Try again'), findsOneWidget);
  });
}
