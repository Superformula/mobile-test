import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superformula_challenge/blocs/blocs.dart';
import 'package:superformula_challenge/repositories/repositories.dart';
import 'package:superformula_challenge/screens/screens.dart';

import '../mock_repositories.dart';

void main() {
  Widget dashboard;
  QrRepository validateSeedRepository = MockQrRepository();
  ValidateSeedBloc validateSeedBloc =
      ValidateSeedBloc(qrRepository: validateSeedRepository);
  setUp(() {
    dashboard = MaterialApp(
      home: Dashboard(),
      builder: (context, child) {
        return BlocProvider<ValidateSeedBloc>(
          create: (context) => validateSeedBloc,
          child: child,
        );
      },
    );
  });

  testWidgets('Speed dial is shown with two options', (tester) async {
    await tester.pumpWidget(dashboard);

    Finder speedDialFinder = find.byType(SpeedDial);
    expect(speedDialFinder, findsOneWidget);

    // SpeedDialChild renders as additional FloatingActionButton
    Finder speedDialChildFinder = find.byType(FloatingActionButton);
    expect(speedDialChildFinder, findsNWidgets(3));
  });

  testWidgets('Dashboard shows error dialog if error occurs during validation',
      (tester) async {
    await tester.pumpWidget(dashboard);

    await tester.pumpAndSettle();

    validateSeedBloc.listen((validateSeedState) async {
      if (validateSeedState is SeedValidationError) {
        // Error dialog should pop up
        Finder dialogFinder = find.byType(AlertDialog);
        expect(dialogFinder, findsOneWidget);
        Finder errorFinder = find.text('Error');
        expect(errorFinder, findsOneWidget);
      }
    });
    validateSeedBloc.emit(SeedValidationError(error: 'error'));
  });

  testWidgets('Dashboard shows dialog with seed if seed is valid',
      (tester) async {
    await tester.pumpWidget(dashboard);

    await tester.pumpAndSettle();

    validateSeedBloc.listen((validateSeedState) async {
      if (validateSeedState is SeedValid) {
        // Alert dialog should pop up
        Finder dialogFinder = find.byType(AlertDialog);
        expect(dialogFinder, findsOneWidget);
        Finder seedFinder = find.text('Secret Word');
        expect(seedFinder, findsOneWidget);
      }
    });
    validateSeedBloc.emit(SeedValid(seed: 'seed'));
  });

  testWidgets('Dashboard shows dialog with error if seed is invalid',
      (tester) async {
    await tester.pumpWidget(dashboard);

    await tester.pumpAndSettle();

    validateSeedBloc.listen((validateSeedState) async {
      if (validateSeedState is SeedValid) {
        // Alert dialog should pop up
        Finder dialogFinder = find.byType(AlertDialog);
        expect(dialogFinder, findsOneWidget);
        Finder errorFinder = find.text('QR code has expired.');
        expect(errorFinder, findsOneWidget);
      }
    });
    validateSeedBloc.emit(SeedInvalid());
  });
}
