import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_test/configs/configurations.dart';
import 'package:qr_code_test/routes/home_page.dart';
import 'package:qr_code_test/routes/home_page/home_body.dart';
import 'utils/bloc_mocks.dart';

void main() {
  CountdownBloc countdownBloc;
  QRFetchBloc qrFetchBloc;
  ValidationBloc validationBloc;
  SliderBloc sliderBloc;

  setUpAll(() {
    countdownBloc = MockCountdownBloc();
    qrFetchBloc = MockQRFetchBloc();
    validationBloc = MockValidationBloc();
    sliderBloc = MockSliderBloc();
  });

  group("Home page rendering tests", () {
    testWidgets("Making sure the page is rendered with essential widgets", (tester) async {
      when(sliderBloc.state).thenReturn(Configurations.slidingMenuWidth);

      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<CountdownBloc>.value(value: countdownBloc),
          BlocProvider<QRFetchBloc>.value(value: qrFetchBloc),
          BlocProvider<ValidationBloc>.value(value: validationBloc),
          BlocProvider<SliderBloc>.value(value: sliderBloc),
        ],
        child: MaterialApp(
          home: Scaffold(body: const HomePage()),
        ),
      ));

      // App bar
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text("Home page"), findsOneWidget);

      // Body
      expect(find.byType(HomeBody), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byType(AnimatedPositioned), findsOneWidget);
    });

    testWidgets("Making sure that there are 2 buttons in the sliding menu with "
        "a specific text inside", (tester) async {
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