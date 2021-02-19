import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  test('check flutter driver health', () async {
    final Health health = await driver.checkHealth();
    expect(health.status, HealthStatus.ok);
    await driver.waitFor(find.text('HOME'));
    final SerializableFinder fabDailerAddIcon = find.byValueKey('fab-dailer');
    await driver.waitFor(fabDailerAddIcon);
    await driver.tap(fabDailerAddIcon);
    await driver.waitFor(find.text('Scan'));
    await driver.waitFor(find.text('QrCode'));
  });
}
