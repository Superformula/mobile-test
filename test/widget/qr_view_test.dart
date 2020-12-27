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
  QrBloc qrBloc = QrBloc(qrRepository: qrRepository);
  setUp(() {
    qrCodeScreen = MaterialApp(
      home: QrView(),
      builder: (context, child) {
        return BlocProvider<QrBloc>(
          create: (context) => qrBloc,
          child: child,
        );
      },
    );
  });

  testWidgets(
      'QR view displays loading indicator when seed is loading and QR code when seed is loaded',
      (tester) async {
    qrBloc.getSeed();
    await tester.pumpWidget(qrCodeScreen);

    Finder progressFinder = find.byType(CircularProgressIndicator);
    expect(progressFinder, findsOneWidget);

    await tester.pumpAndSettle();

    Finder qrFinder = find.byType(QrImage);
    expect(progressFinder, findsNothing);
    expect(qrFinder, findsOneWidget);
  });
}
