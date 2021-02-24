import 'package:flutter_test/flutter_test.dart';

import 'package:qr_generator/src/features/qr_scan/logic/qr_scan_provider.dart';
import 'package:qr_generator/src/features/qr_scan/logic/qr_scan_state.dart';

void main() {
  QrScanNotifier notifier;

  setUp(() => notifier = QrScanNotifier());

  group('QrGenNotifier', () {
    const tDecodeString = 'myRandomString';

    // Expected emitted states from notifier
    final tAddScanStates = <String>[
      const Initial().toString(),
      const Scanning().toString(),
      const Scanned(decodedStrings: [tDecodeString]).toString(),
    ];

    test(
      'Should emit expected state when calling addScan.',
      () async {
        // setup -> create the object to test
        final expectedStates = <String>[];

        // side effects -> collect the result to test
        notifier
          ..addListener((state) => expectedStates.add(state.toString()))
          ..addScan(tDecodeString);

        // expectations -> compare result to expected value
        expect(expectedStates, tAddScanStates);
      },
    );
  });
}
