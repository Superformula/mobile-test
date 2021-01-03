import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code_test/routes/home_page.dart';
import 'package:qr_code_test/routes/home_page/home_body.dart';
import 'utils/bloc_mocks.dart';

void main() {
  CountdownBloc countdownBloc;
  QRFetchBloc qrFetchBloc;
  ValidationBloc validationBloc;

  setUpAll(() {
    countdownBloc = MockCountdownBloc();
    qrFetchBloc = MockQRFetchBloc();
    validationBloc = MockValidationBloc();
  });

  group("Home page rendering tests", () {
    testWidgets("Making sure the page is rendered with essential widgets", (tester) async {
      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<CountdownBloc>.value(value: countdownBloc),
          BlocProvider<QRFetchBloc>.value(value: qrFetchBloc),
          BlocProvider<ValidationBloc>.value(value: validationBloc),
        ],
        child: MaterialApp(
          home: const HomePage(),
        ),
      ));

      // App bar
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text("Home page"), findsOneWidget);

      // Body
      expect(find.byType(HomeBody), findsOneWidget);
      expect(find.byType(RaisedButton), findsNWidgets(2));
    });

    testWidgets("Making sure the page is rendered with essential widgets", (tester) async {
      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<QRFetchBloc>.value(value: qrFetchBloc),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: const HomeBody(),
          ),
        ),
      ));

      expect(find.byType(RaisedButton), findsNWidgets(2));
      expect(find.text("Fetch QR"), findsOneWidget);
      expect(find.text("Scan QR"), findsOneWidget);
    });
  });
}