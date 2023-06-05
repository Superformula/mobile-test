import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_code/scan/cubit/scan_cubit.dart';
import 'package:qr_code_repository/qr_code_repository.dart';

class MockQrCodeRepository extends Mock implements QrCodeRepository {}

void main() {
  late QrCodeRepository qrCodeRepository;
  const qrCode = 'as9dh89ahda88ss9';

  setUp(() {
    qrCodeRepository = MockQrCodeRepository();
  });

  ScanCubit buildCubit() => ScanCubit(qrCodeRepository: qrCodeRepository);

  group('constructor', () {
    test('works properly', () {
      expect(buildCubit, returnsNormally);
    });

    test('has correct initial state', () {
      expect(buildCubit().state, equals(const ScanState()));
    });

    blocTest<ScanCubit, ScanState>(
      'emits successful true when repository fetches correctly',
      build: buildCubit,
      setUp: () {
        when(() => qrCodeRepository.validateQrCode()).thenAnswer(
          (_) async => true,
        );
      },
      act: (cubit) => cubit.validateQrCode(qrCode: qrCode),
      expect: () => [
        const ScanState(
          status: ScanStatus.success,
          isValid: true,
        )
      ],
    );

    blocTest<ScanCubit, ScanState>(
      'emits successful false when repository fetches correctly',
      build: buildCubit,
      setUp: () {
        when(() => qrCodeRepository.validateQrCode()).thenAnswer(
          (_) async => false,
        );
      },
      act: (cubit) => cubit.validateQrCode(qrCode: qrCode),
      expect: () => [
        const ScanState(
          status: ScanStatus.success,
          isValid: false,
        )
      ],
    );

    blocTest<ScanCubit, ScanState>(
      'emits failure false when repository throw',
      build: buildCubit,
      setUp: () {
        when(() => qrCodeRepository.validateQrCode()).thenThrow(
          Exception('Ops'),
        );
      },
      act: (cubit) => cubit.validateQrCode(qrCode: qrCode),
      expect: () => [
        const ScanState(
          status: ScanStatus.failure,
        )
      ],
    );
  });
}
