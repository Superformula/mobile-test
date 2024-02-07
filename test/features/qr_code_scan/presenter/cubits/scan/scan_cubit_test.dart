import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/cubits/scan/scan_cubit.dart';

import '../../../mocks/mocktail.dart';

void main() {
  group('ScanCubit |', () {
    late ScanCubit scanCubit;
    late MockQRViewController mockController;

    setUp(() {
      mockController = MockQRViewController();
      scanCubit = ScanCubit();
    });

    tearDown(() {
      scanCubit.close();
    });

    test('initial state is ScanInitialState', () {
      expect(scanCubit.state, equals(const ScanInitialState()));
    });

    test('emits ScannedDataState when QR code is scanned', () {
      final testScanData = Barcode('testData', BarcodeFormat.qrcode, [1, 2, 3]);
      when(() => mockController.scannedDataStream)
          .thenAnswer((_) => Stream.fromIterable([testScanData]));

      scanCubit.onQRViewCreated(mockController);

      expectLater(
        scanCubit.stream,
        emitsInOrder([const ScannedDataState(data: 'testData')]),
      );
    });

    test('startScan emits ScanningState', () {
      scanCubit.startScan();
      expect(scanCubit.state, equals(const ScanningState()));
    });
  });
}
