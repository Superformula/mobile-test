import 'package:fake_async/fake_async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mobile_test/src/screens/qr_code_generator.dart';

import '../mockSetUp/test_setup.dart';

void main() {
  group('Golden Test: QRCode screen elements render properly', () {
    testGoldens('QRCode screen elements renders properly',
        (WidgetTester tester) async {
      FakeAsync().run((FakeAsync async) async {
        await loadAppFonts();
        await tester.pumpWidgetBuilder(
            Container(
              height: 200,
              width: 300,
              child: GenerateQRCodeScreen(
                qrCodeBloc: mockQRCodeGeneratorBloc(),
              ),
            ),
            surfaceSize: const Size(200, 500),
            wrapper: materialAppWrapper(
                theme: ThemeData.light(), platform: TargetPlatform.iOS));
        await screenMatchesGolden(tester, 'qr_code_screen_golden');
      });
    });
  });

  group('Golden Test: QRCode expired button render properly', () {
    testGoldens('QRCode expired button  renders properly',
        (WidgetTester tester) async {
      FakeAsync().run((FakeAsync async) async {
        await loadAppFonts();
        await tester.pumpWidgetBuilder(
            Container(
              height: 1000,
              width: 1000,
              child: GenerateQRCodeScreen(
                qrCodeBloc: mockQRCodeGeneratorBloc(
                    dateTime: '2021-02-18T23:42:30.802Z'),
              ),
            ),
            surfaceSize: const Size(300, 800),
            wrapper: materialAppWrapper(
                theme: ThemeData.light(), platform: TargetPlatform.iOS));
        await screenMatchesGolden(tester, 'qr_code_screen_expired_golden');
      });
    });
  });
}
