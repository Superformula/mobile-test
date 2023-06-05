import 'package:bloc_test/bloc_test.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_code/qr_code/qr_code.dart';
import 'package:qr_code_repository/qr_code_repository.dart';

class MockQrCodeRepository extends Mock implements QrCodeRepository {}

void main() {
  final qrCode = QrCode(
    seed: '224i2dnh28h828dFASd236H',
    expiresAt: DateTime.tryParse('1979-11-12T13:10:42.24Z'),
  );

  group('QrCodeCubit', () {
    late QrCodeRepository qrCodeRepository;

    setUp(() {
      qrCodeRepository = MockQrCodeRepository();
    });

    QrCodeCubit buildCubit() => QrCodeCubit(qrCodeRepository: qrCodeRepository);

    group('constructor', () {
      test('works properly', () {
        expect(buildCubit, returnsNormally);
      });

      test('has correct initial state', () {
        expect(buildCubit().state, equals(const QrCodeState()));
      });
    });

    blocTest<QrCodeCubit, QrCodeState>(
      'emits successful when repository fetches correctly',
      build: buildCubit,
      setUp: () {
        when(() => qrCodeRepository.getSeed()).thenAnswer((_) async => qrCode);
        when(
          () => qrCodeRepository.seedCountDown(
            expireDate: any(named: 'expireDate'),
          ),
        ).thenAnswer((_) => const Stream<int>.empty());
      },
      expect: () => [
        QrCodeState(
          status: QrCodeStatus.success,
          qrCode: qrCode,
        )
      ],
    );

    blocTest<QrCodeCubit, QrCodeState>(
      'emits failure when repository fetches incorrectly',
      build: buildCubit,
      setUp: () {
        when(
          () => qrCodeRepository.getSeed(),
        ).thenAnswer((_) async => throw SeedRequestException());
      },
      expect: () => [
        const QrCodeState(
          status: QrCodeStatus.failure,
        )
      ],
    );

    blocTest<QrCodeCubit, QrCodeState>(
      'emits successful countdown given success fetch qr code from repository',
      build: buildCubit,
      seed: () => QrCodeState(
        status: QrCodeStatus.success,
        qrCode: qrCode,
      ),
      setUp: () {
        when(() => qrCodeRepository.getSeed()).thenAnswer((_) async => qrCode);
        when(
          () => qrCodeRepository.seedCountDown(
            expireDate: any(named: 'expireDate'),
          ),
        ).thenAnswer((_) => Stream<int>.fromIterable([3, 2, 1]));
      },
      expect: () => [
        QrCodeState(status: QrCodeStatus.success, qrCode: qrCode, duration: 3),
        QrCodeState(status: QrCodeStatus.success, qrCode: qrCode, duration: 2),
        QrCodeState(status: QrCodeStatus.success, qrCode: qrCode, duration: 1),
      ],
    );

    blocTest<QrCodeCubit, QrCodeState>(
      'emits successful fetch qr code from repository after countdown ends',
      build: buildCubit,
      setUp: () {
        when(() => qrCodeRepository.getSeed()).thenAnswer((_) async => qrCode);
        when(
          () => qrCodeRepository.seedCountDown(
            expireDate: any(named: 'expireDate'),
          ),
        ).thenAnswer((_) => Stream<int>.fromIterable([3, 2, 1]));
      },
      act: (cubit) => cubit.countDown(duration: 0),
      expect: () => <QrCodeState>[
        const QrCodeState(),
        QrCodeState(status: QrCodeStatus.success, qrCode: qrCode),
        QrCodeState(status: QrCodeStatus.success, qrCode: qrCode, duration: 3),
        QrCodeState(status: QrCodeStatus.success, qrCode: qrCode, duration: 2),
        QrCodeState(status: QrCodeStatus.success, qrCode: qrCode, duration: 1),
      ],
      verify: (_) {
        verify(() => qrCodeRepository.getSeed()).called(2);
      },
    );
  });
}
