import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code/redux/store.dart';

import '../../mocks.dart';
import '../../widget_tester_extension.dart';

void main() {
  testWidgets(
      'GIVEN a valid qr code'
      'WHEN ValidationDialog is displayed '
      'THEN it shows a progress indicator '
      'AND a successful message', (WidgetTester tester) async {
    final apiClient = ApiClientMock();
    when(apiClient.validateQrCode('golden')).thenAnswer((_) => Future.value(true));

    final store = createReduxStore(apiClient: apiClient);
    await tester.pumpValidationDialog(codeToValidate: 'golden', store: store);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.text("Good job! You've got a valid QR Code"), findsOneWidget);
  });

  testWidgets(
      'GIVEN an expired qr code'
      'WHEN ValidationDialog is displayed '
      'THEN it shows an error message', (WidgetTester tester) async {
    final apiClient = ApiClientMock();
    when(apiClient.validateQrCode('golden')).thenAnswer((_) => Future.value(false));

    final store = createReduxStore(apiClient: apiClient);
    await tester.pumpValidationDialog(codeToValidate: 'golden', store: store);
    await tester.pumpAndSettle();

    expect(find.text('This QR Code has expired. Try a new one'), findsOneWidget);
  });

  testWidgets(
      'GIVEN ValidationDialog is displayed'
      'WHEN qr code validation fails '
      'THEN it shows an error message', (WidgetTester tester) async {
    final apiClient = ApiClientMock();
    when(apiClient.validateQrCode('golden')).thenAnswer((_) => Future.error(Exception()));

    final store = createReduxStore(apiClient: apiClient);
    await tester.pumpValidationDialog(codeToValidate: 'golden', store: store);
    await tester.pumpAndSettle();

    expect(find.text('Something wrong happened'), findsOneWidget);
    expect(find.text('Try again'), findsOneWidget);
  });
}
