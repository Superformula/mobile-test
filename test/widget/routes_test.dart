import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_test/configs/configurations.dart';
import 'package:qr_code_test/configs/routes.dart';
import 'package:qr_code_test/routes/home_page.dart';

import 'utils/bloc_mocks.dart';

void main() {
  NavigatorObserver mockObserver;

  CountdownBloc countdownBloc;
  QRFetchBloc qrFetchBloc;
  SliderBloc sliderBloc;
  ValidationBloc validationBloc;

  setUp(() {
    mockObserver = MockNavigatorObserver();

    countdownBloc = MockCountdownBloc();
    qrFetchBloc = MockQRFetchBloc();
    sliderBloc = MockSliderBloc();
    validationBloc = MockValidationBloc();
  });

  Future<void> _buildHome(WidgetTester tester) async {
    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider.value(value: countdownBloc),
        BlocProvider.value(value: qrFetchBloc),
        BlocProvider.value(value: sliderBloc),
        BlocProvider.value(value: validationBloc),
      ],
      child: MaterialApp(
        home: HomePage(),
        onGenerateRoute: RouteGenerator.generateRoute,
        onGenerateTitle: (_) => "Home page",
        initialRoute: RouteGenerator.homePage,
        navigatorObservers: [mockObserver],
      ),
    ));

    verify(mockObserver.didPush(any, any));
  }

  group("Testing the app's routes", () {
    testWidgets("Testing the routing on the 'Fetch' page", (tester) async {
      when(sliderBloc.state).thenReturn(16);

      await _buildHome(tester);
      await tester.tap(find.byKey(Key("home_fetch_qr_button")));

      verify(mockObserver.didPush(any, any)).called(1);
    });

    testWidgets("Testing the routing on the 'Scan' page", (tester) async {
      when(sliderBloc.state).thenReturn(16);

      await _buildHome(tester);
      await tester.tap(find.byKey(Key("home_scan_qr_button")));

      verify(mockObserver.didPush(any, any)).called(1);
    });
  });
}