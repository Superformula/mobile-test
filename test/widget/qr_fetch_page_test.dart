import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_test/routes/qr_fetch_page.dart';
import 'package:qr_code_test/routes/qr_fetch_page/error_widget.dart';
import 'package:qr_code_test/routes/qr_fetch_page/qr_widget.dart';
import 'utils/bloc_mocks.dart';

void main() {
  CountdownBloc countdownBloc;
  QRFetchBloc qrFetchBloc;
  Seed mockSeed;

  setUpAll(() {
    countdownBloc = MockCountdownBloc();
    qrFetchBloc = MockQRFetchBloc();
    mockSeed = Seed.fromJson({
      "seed": "abc",
      "expires_at": "123"
    });
  });

  group("Fetch page rendering tests", () {
    testWidgets("Making sure the page shows the QR code when the seed has been "
        "properly fetched from the server", (tester) async {
      // Mocking the bloc response
      when(qrFetchBloc.state).thenReturn(QRLoaded(
        seed: mockSeed,
        timeLeft: 15
      ));

      when(countdownBloc.state).thenReturn(const CountdownInProgress(15));

      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<CountdownBloc>.value(value: countdownBloc),
          BlocProvider<QRFetchBloc>.value(value: qrFetchBloc),
        ],
        child: MaterialApp(
          home: const QRFetchRoute(),
        ),
      ));

      // App bar
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text("QR Code"), findsOneWidget);

      // Body
      expect(find.byType(QRDisplay), findsOneWidget);
    });

    testWidgets("Making sure the page shows an error page when the seed hasn't "
        " been properly fetched from the server", (tester) async {
      // Mocking the bloc response
      when(qrFetchBloc.state).thenReturn(const QRError());

      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<CountdownBloc>.value(value: countdownBloc),
          BlocProvider<QRFetchBloc>.value(value: qrFetchBloc),
        ],
        child: MaterialApp(
          home: const QRFetchRoute(),
        ),
      ));

      // App bar
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text("QR Code"), findsOneWidget);

      // Body
      expect(find.byType(QRErrorWidget), findsOneWidget);
    });

    testWidgets("Making sure the page shows a loading spinner while the seed is "
        "being fetched via HTTP", (tester) async {
      // Mocking the bloc response
      when(qrFetchBloc.state).thenReturn(const QRLoading());

      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<CountdownBloc>.value(value: countdownBloc),
          BlocProvider<QRFetchBloc>.value(value: qrFetchBloc),
        ],
        child: MaterialApp(
          home: const QRFetchRoute(),
        ),
      ));

      // App bar
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text("QR Code"), findsOneWidget);

      // Body
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(QRErrorWidget), findsNothing);
      expect(find.byType(QRDisplay), findsNothing);
    });
  });
}