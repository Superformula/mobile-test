// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('QrGenerator App', () {
    ///QrGeneratorPage
    final primaryFloatingButton = find.byValueKey('kPrimaryFloatingButton');
    final generateQrButton = find.byValueKey('kGenerateQrButton');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('Generate QrCode', () async {
      await driver.tap(primaryFloatingButton);
      await driver.tap(generateQrButton);

      await driver.waitFor(find.byValueKey('QrWidget'));
    });
  });
}
