import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_test/routes/qr_fetch_page/countdown_time.dart';

import '../utils/bloc_mocks.dart';

void main() {
  CountdownBloc countdownBloc;

  setUpAll(() {
    countdownBloc = MockCountdownBloc();
  });

  group("Rendering tests for the 'CountdownTime' widget", () {
    testWidgets("Making sure the widget shows hours, minutes and seconds when "
        "all of these time units are greater than zero.", (tester) async {
      when(countdownBloc.state).thenReturn(const CountdownInProgress(7388));

      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<CountdownBloc>.value(value: countdownBloc),
        ],
        child: MaterialApp(
          home: const CountdownTime(),
        ),
      ));

      final time = Duration(seconds: countdownBloc.state.totalSeconds);

      expect(find.byType(Text), findsOneWidget);
      expect(time.inSeconds.remainder(60), equals(8));
      expect(time.inMinutes.remainder(60), equals(3));
      expect(time.inHours.remainder(60), equals(2));
    });

    testWidgets("Making sure the widget shows minutes and seconds when hours "
        "are at zero but the other units are all positive.", (tester) async {
      when(countdownBloc.state).thenReturn(const CountdownInProgress(84));

      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<CountdownBloc>.value(value: countdownBloc),
        ],
        child: MaterialApp(
          home: const CountdownTime(),
        ),
      ));

      final time = Duration(seconds: countdownBloc.state.totalSeconds);

      expect(find.byType(Text), findsOneWidget);
      expect(time.inSeconds.remainder(60), equals(24));
      expect(time.inMinutes.remainder(60), equals(1));
      expect(time.inHours.remainder(60), equals(0));
    });

    testWidgets("Making sure the widget shows only seconds when hours and "
        "minutes are at zero.", (tester) async {
      when(countdownBloc.state).thenReturn(const CountdownInProgress(17));

      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<CountdownBloc>.value(value: countdownBloc),
        ],
        child: MaterialApp(
          home: const CountdownTime(),
        ),
      ));

      final time = Duration(seconds: countdownBloc.state.totalSeconds);

      expect(find.byType(Text), findsOneWidget);
      expect(time.inSeconds.remainder(60), equals(17));
      expect(time.inMinutes.remainder(60), equals(0));
      expect(time.inHours.remainder(60), equals(0));
    });
  });
}