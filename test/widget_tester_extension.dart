import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code/home/home_page.dart';
import 'package:qr_code/qr_code/qr_code_page.dart';
import 'package:qr_code/redux/app_state.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:redux/redux.dart';

import 'fixtures.dart';

extension WidgetTesterExtension on WidgetTester {
  Future pumpHomePage([Store<AppState> store]) async {
    await pumpPage(HomePage(), store);
  }

  Future pumpQrCodePage([Store<AppState> store]) async {
    await pumpPage(QrCodePage(), store);
  }

  Future pumpPage(Widget page, [Store<AppState> store]) async {
    await pumpWidget(StoreProvider(
      store: store ?? Fixtures.store(),
      child: MaterialApp(
        home: page,
      ),
    ));
  }

  Future findGoldenQrCode() async {
    final qrCodeFinder = find.byType(QrImage);
    expect(qrCodeFinder, findsOneWidget);

    await expectLater(
      qrCodeFinder,
      matchesGoldenFile('goldens/qr_code.png'),
    );
  }

  Future settleNavigation() async {
    await pump();
    await pump(const Duration(seconds: 3));
  }
}
