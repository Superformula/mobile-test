import 'package:flutter_test/flutter_test.dart';

import 'package:massula_test/main.dart';
import 'package:massula_test/pages/home.dart';
import 'package:massula_test/pages/qr_code.dart';

import '../mocks/qr_code_web_client_mock.dart';
import 'events/events.dart';

void main() {
  testWidgets('Go to QR Code Page', (WidgetTester tester) async {
    final qrCodeWebClientMock = QRCodeWebClientMock();

    await tester.pumpWidget(MyApp(qrCodeWebClient: qrCodeWebClientMock));

    final homePage = find.byType(Home);
    expect(homePage, findsOneWidget);

    await tapOnHomeFAB(tester);
    await tester.pumpAndSettle();

    await tapOnQRCodeButton(tester);
    await tester.pumpAndSettle();

    final qrCodePage = find.byType(QrCodeContainer);
    expect(qrCodePage, findsOneWidget);
  });
}
