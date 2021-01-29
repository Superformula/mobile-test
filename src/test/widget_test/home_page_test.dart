import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qrcodevalidator/app/pages/display_qr_code/display_qr_code_view.dart';
import 'package:qrcodevalidator/app/pages/home/home_page.dart';
import 'package:qrcodevalidator/app/pages/scan_qr_code/scan_qr_code_view.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('HomePage can navigate to QR Code display page',
      (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();

    await tester.pumpWidget(
      MaterialApp(
        navigatorObservers: [mockObserver],
        initialRoute: '/',
        routes: {
          '/': (_) => HomePage(),
          '/DisplayQRCode': (_) => DisplayQRCodeView()
        },
      ),
    );

    expect(find.byTooltip('Show buttons'), findsOneWidget);
    await tester.tap(find.byTooltip('Show buttons'));
    await tester.pumpAndSettle();

    expect(find.byTooltip('QR Code'), findsOneWidget);
    await tester.tap(find.byTooltip('QR Code'));
    await tester.pumpAndSettle();

    /// Verify that a push event happened
    verify(mockObserver.didPush(any, any));

    /// You'd also want to be sure that your page is now
    /// present in the screen.
    expect(find.byType(DisplayQRCodeView), findsOneWidget);
  });

  testWidgets('HomePage can navigate to Scan QR Code page',
      (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();

    await tester.pumpWidget(
      MaterialApp(
        navigatorObservers: [mockObserver],
        initialRoute: '/',
        routes: {
          '/': (_) => HomePage(),
          '/ScanQRCode': (_) => ScanQRCodeView(),
        },
      ),
    );

    expect(find.byTooltip('Show buttons'), findsOneWidget);
    await tester.tap(find.byTooltip('Show buttons'));
    await tester.pumpAndSettle();

    expect(find.byTooltip('Scan'), findsOneWidget);
    await tester.tap(find.byTooltip('Scan'));
    await tester.pumpAndSettle();

    /// Verify that a push event happened
    verify(mockObserver.didPush(any, any));

    /// You'd also want to be sure that your page is now
    /// present in the screen.
    expect(find.byType(ScanQRCodeView), findsOneWidget);
  });
}
