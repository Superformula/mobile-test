import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qrtestcodeone/app/strings.dart';
import 'package:qrtestcodeone/domain/entity/qr_seed.dart';
import 'package:qrtestcodeone/feature/home/bloc/home_bloc.dart';
import 'package:qrtestcodeone/feature/home/home_page.dart';
import 'package:qrtestcodeone/feature/home/widget/home_qrcode.dart';
import 'package:qrtestcodeone/feature/home/widget/home_qrcode_scanner.dart';

import '../mock.dart';

///
/// Created by Pablo Reyes [devpab@gmail.com] on 21/07/21.
///

void main() {
  late HomeBloc homeBloc;
  final QrSeed qrSeed = QrSeed(seed: '1234', expiresAt: DateTime.now());

  setUp(() {
    registerFallbackValue<HomeState>(HomeState.initial());
    registerFallbackValue<HomeEvent>(HomeEvent.generateQrCode());

    homeBloc = MockHomeBloc();
  });

  testWidgets(
    'when initial state, should draw empty body and FAB button',
    (tester) async {
      when(() => homeBloc.state).thenReturn(HomeState.initial());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: homeBloc,
            child: HomePage(),
          ),
        ),
      );

      await tester.pump(Duration(seconds: 3));
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(SpeedDial), findsOneWidget);
      expect(find.text(Strings.kHomePressFabButton), findsOneWidget);
      await expectLater(
        find.byType(HomePage),
        matchesGoldenFile('home_page.png'),
      );
    },
  );

  testWidgets(
    'when onQrSeedReady state, should draw a qr-viewer',
    (tester) async {
      when(() => homeBloc.state).thenReturn(HomeState.onQrSeedReady(qrSeed));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: homeBloc,
            child: HomePage(),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(HomeQrCode), findsOneWidget);
    },
  );

  testWidgets(
    'when onQrScanRequested state, should draw a qr-scanner',
    (tester) async {
      when(() => homeBloc.state).thenReturn(HomeState.onQrScanRequested());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: homeBloc,
            child: HomePage(),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(HomeQrCodeScanner), findsOneWidget);
    },
  );

  ///TODO: finish all the remaining test-cases
}
