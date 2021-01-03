import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_test/configs/routes.dart';
import 'package:qr_code_test/routes/qr_fetch_page.dart';
import 'package:qr_code_test/routes/qr_fetch_page/error_widget.dart';
import 'package:qr_code_test/routes/qr_fetch_page/qr_widget.dart';
import 'package:qr_code_test/routes/qr_scan_page.dart';
import 'package:qr_code_test/routes/qr_validation_page.dart';
import 'utils/bloc_mocks.dart';

void main() {
  ValidationBloc validationBloc;
  NavigatorObserver mockObserver;

  setUpAll(() {
    validationBloc = MockValidationBloc();
    mockObserver = MockNavigatorObserver();
  });

  group("Scan page rendering tests", () {
    testWidgets("Making sure the page shows a QR scanner at the center of the "
        "screen", (tester) async {
      // Mocking the bloc response
      when(validationBloc.state).thenReturn(const ValidationNone());

      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<ValidationBloc>.value(value: validationBloc),
        ],
        child: MaterialApp(
          home: const QRScanRoute(),
          navigatorObservers: [mockObserver],
        ),
      ));

      // App bar
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text("QR Scan"), findsOneWidget);
      expect(find.byType(QRBarScannerCamera), findsOneWidget);
    });

    testWidgets("Making sure that the 'QRValidationRoute' route is opened as "
        "soon as a code is scanned", (tester) async {
      // Mocking the bloc response
      when(validationBloc.state).thenReturn(const ValidationNone());

      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<ValidationBloc>.value(value: validationBloc),
        ],
        child: MaterialApp(
          home: const QRScanRoute(),
        ),
      ));

      // At this point, the user is scanning a QR code.
      expect(find.byType(QRBarScannerCamera), findsOneWidget);

      // Now we pretend that a code has been scanned...
      when(validationBloc.state).thenReturn(const ValidationSuccess("abc"));
      validationBloc.add("abc");

      // And the validation page must appear
      await tester.pump();
      verify(mockObserver.didPush(any, any)).called(1);
    });

  });
}