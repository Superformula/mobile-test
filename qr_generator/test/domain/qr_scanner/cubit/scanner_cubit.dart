import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_generator/domain/qr_scanner/cubit/scanner_cubit.dart';

void main() {
  group('$ScannerCubit tests', () {
    late ScannerCubit cubit;

    setUp(() {
      cubit = ScannerCubit();
    });

    blocTest<ScannerCubit, ScannerState>(
      'ProcessBarcode function emits a ValidScanState',
      build: () => cubit,
      act: (ScannerCubit cubit) =>
          cubit.processBarcode(Barcode('', BarcodeFormat.qrcode, [])),
      expect: () => [isA<ValidScanState>()],
    );

    tearDown(() {
      cubit.close();
    });
  });
}
