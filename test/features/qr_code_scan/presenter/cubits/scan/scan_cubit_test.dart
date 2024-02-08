import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/cubits/scan/scan_cubit.dart';

class MockQRViewController extends Mock implements QRViewController {}

void main() {
  group('ScanCubit |', () {
    late ScanCubit scanCubit;

    setUp(() {
      scanCubit = ScanCubit();
    });

    tearDown(() {
      scanCubit.close();
    });

    test('initial state should be ScanInitialState', () {
      expect(scanCubit.state, equals(const ScanInitialState()));
    });

    blocTest<ScanCubit, ScanState>(
      'should emit [ScannedDataState] when onQRViewCreated is called with non-null scanData',
      build: () => scanCubit,
      act: (cubit) {
        final mockController = MockQRViewController();
        when(() => mockController.scannedDataStream).thenAnswer(
          (_) => Stream.fromIterable(
            [
              Barcode(
                'example',
                BarcodeFormat.qrcode,
                [0, 1, 2, 3],
              ),
            ],
          ),
        );
        cubit.onQRViewCreated(mockController);
      },
      expect: () => const <ScanState>[
        ScannedDataState(data: 'example'),
      ],
    );

    blocTest<ScanCubit, ScanState>(
      'should emit [ScanningState] when startScan is called',
      build: () => scanCubit,
      act: (cubit) => cubit.startScan(),
      expect: () => const <ScanState>[
        ScanningState(),
      ],
    );
  });
}
