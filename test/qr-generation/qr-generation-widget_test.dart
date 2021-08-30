import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_generator/models/qr-response-models.dart';
import 'package:qr_generator/providers/bloc-provider.dart';
import 'package:qr_generator/qr-generation/qr-generation-bloc.dart';
import 'package:qr_generator/qr-generation/qr-generation-screen.dart';

import '../app-mocks.dart';
import '../app-test-widget.dart';

void main() {
  
  Key qrCodeKey = Key("qrCode");
  Key expirationTimerKey = Key("expirationTimer");
  Key retryButtonKey = Key("retryButton");

  group("QR generation widget tests", () {

    late Widget underTest;

    late MockAppBackendClient mockBackendClient;
    late MockNavigatorObserver mockObserver;


    setUp(() {
      mockBackendClient = MockAppBackendClient();
      mockObserver = MockNavigatorObserver();

      underTest = AppTestWidget(
        child: BlocProvider(
          bloc: QRGenerationBloc(mockBackendClient),
          child: QRGenerationScreen(),
        ),
        mockNavigatorObserver: mockObserver
      ).buildSut();
    });

    testWidgets("Given a valid QR code and unexpired timer, when screen loads, then code and timer are shown", (WidgetTester tester) async {

      // set up
      when(() => mockBackendClient.getGeneratedSeed()).thenAnswer((_) {
        return Future.value(
          QRSeed(
            "example.com",
            DateTime.now().add(Duration(minutes: 1))
          )
        );
      });

      // load widget
      await tester.pumpWidget(underTest);
      // Expiration timer has to wait 1 tick to pump stream
      // so add 1 tick delay to pump widget
      await tester.pumpAndSettle(Duration(seconds: 1));

      expect(find.byKey(qrCodeKey), findsOneWidget);
      expect(find.byKey(expirationTimerKey), findsOneWidget);
      expect(find.byKey(retryButtonKey), findsNothing);
    });

    testWidgets("Given expired QR code, when screen loads, then error screen is shown", (WidgetTester tester) async {

      // set up
      when(() => mockBackendClient.getGeneratedSeed()).thenAnswer((_) {
        return Future.value(
          QRSeed(
            "example.com",
            DateTime.now().subtract(Duration(minutes: 1))
          )
        );
      });

      // load widget
      await tester.pumpWidget(underTest);
      await tester.pumpAndSettle();

      expect(find.byKey(qrCodeKey), findsNothing);
      expect(find.byKey(expirationTimerKey), findsNothing);
      expect(find.byKey(retryButtonKey), findsOneWidget);
    });

    testWidgets("Given expired QR code error, when retry button is tapped, then new code is loaded", (WidgetTester tester) async {

      // set up
      when(() => mockBackendClient.getGeneratedSeed()).thenAnswer((_) {
        return Future.value(
          QRSeed(
            "example.com",
            DateTime.now().subtract(Duration(minutes: 1))
          )
        );
      });

      // load widget
      await tester.pumpWidget(underTest);
      await tester.pumpAndSettle();

      // verify error state
      expect(find.byKey(qrCodeKey), findsNothing);
      expect(find.byKey(expirationTimerKey), findsNothing);
      expect(find.byKey(retryButtonKey), findsOneWidget);

      // prepare valid code to be fetched
      when(() => mockBackendClient.getGeneratedSeed()).thenAnswer((_) {
        return Future.value(
          QRSeed(
            "example.com",
            DateTime.now().add(Duration(minutes: 1))
          )
        );
      });

      // tap retry button
      await tester.tap(find.byKey(retryButtonKey));
      // Delay pump for timer tick
      await tester.pumpAndSettle(Duration(seconds: 1));

      // verify fresh code was loaded
      expect(find.byKey(qrCodeKey), findsOneWidget);
      expect(find.byKey(expirationTimerKey), findsOneWidget);
      expect(find.byKey(retryButtonKey), findsNothing);
    });
  });
}