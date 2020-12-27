import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:superformula_challenge/blocs/blocs.dart';
import 'package:superformula_challenge/repositories/repositories.dart';
import 'package:superformula_challenge/screens/screens.dart';

import '../mock_repositories.dart';

void main() {
  Widget qrCodeScreen;
  QrRepository qrRepository = MockQrRepository();
  GetSeedBloc getSeedBloc = GetSeedBloc(qrRepository: qrRepository);
  setUp(() {
    qrCodeScreen = MaterialApp(
      home: QrView(),
      builder: (context, child) {
        return BlocProvider<GetSeedBloc>(
          create: (context) => getSeedBloc,
          child: child,
        );
      },
    );
  });

  testWidgets(
      'QR view displays loading indicator when seed is loading and QR code when seed is loaded',
      (tester) async {
    getSeedBloc.getSeed();
    await tester.pumpWidget(qrCodeScreen);

    Finder progressFinder = find.byType(CircularProgressIndicator);
    expect(progressFinder, findsOneWidget);

    await tester.pumpAndSettle();

    Finder qrFinder = find.byType(QrImage);
    expect(progressFinder, findsNothing);
    expect(qrFinder, findsOneWidget);
  });

  testWidgets('QR view shows error dialog if error is emitted from QR bloc',
      (tester) async {
    await tester.pumpWidget(qrCodeScreen);

    await tester.pumpAndSettle();

    getSeedBloc.listen((qrState) async {
      if (qrState is SeedError) {
        // Error dialog should pop up
        Finder dialogFinder = find.byType(AlertDialog);
        expect(dialogFinder, findsOneWidget);
      }
    });
    getSeedBloc.emit(SeedError(error: 'error'));
  });
}
