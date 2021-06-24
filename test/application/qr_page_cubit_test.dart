import 'package:dartz/dartz.dart';
import 'package:qr_generator/domain/failures/common_failure.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:qr_generator/application/qr_page/qr_page_cubit.dart';
import 'package:qr_generator/domain/i_seed_generator_repository.dart';
import 'package:qr_generator/domain/seed.dart';

class MockSeedGeneratorRepository extends Mock
    implements ISeedGeneratorRepository {}

void main() {
  late MockSeedGeneratorRepository mockSeedGeneratorRepository;
  late QrPageCubit cubit;
  final now = DateTime.now();

  setUp(() {
    mockSeedGeneratorRepository = MockSeedGeneratorRepository();
    cubit = QrPageCubit(mockSeedGeneratorRepository);
  });

  group('QRPageCubit initialization', () {
    const ttl = 4;
    final seed = Seed(
      seed: '123456',
      expiresAt: now.add(const Duration(seconds: ttl)),
    );

    blocTest<QrPageCubit, QrPageState>(
      'Fetches a seed succesfully, emits [QrPageState.loaded]',
      build: () {
        when(() => mockSeedGeneratorRepository.fetchSeed())
            .thenAnswer((invocation) async => right(seed));
        return cubit;
      },
      act: (cubit) => cubit.loadQr(now),
      expect: () => [QrPageState.loaded(seed: seed, ttl: ttl)],
    );

    blocTest<QrPageCubit, QrPageState>(
      'Fetches an expired seed from cache, emits [QrPageState.loadError]',
      build: () {
        when(() => mockSeedGeneratorRepository.fetchSeed()).thenAnswer(
          (invocation) async => right(
            Seed(
              seed: '123456',
              expiresAt: now.add(const Duration(seconds: -ttl)),
            ),
          ),
        );
        return cubit;
      },
      act: (cubit) => cubit.loadQr(now),
      expect: () =>
          [const QrPageState.loadError(failure: CommonFailure.noInternet())],
    );

    blocTest<QrPageCubit, QrPageState>(
      'Fetches seed with no internet, emits [QrPageState.loadError]',
      build: () {
        when(() => mockSeedGeneratorRepository.fetchSeed()).thenAnswer(
            (invocation) async => left(const CommonFailure.noInternet()));
        return cubit;
      },
      act: (cubit) => cubit.loadQr(now),
      expect: () =>
          [const QrPageState.loadError(failure: CommonFailure.noInternet())],
    );
    blocTest<QrPageCubit, QrPageState>(
      'Fetches new seed after expiring, emits [QrPageState.loadError]',
      build: () {
        when(() => mockSeedGeneratorRepository.fetchSeed()).thenAnswer(
            (invocation) async => left(const CommonFailure.noInternet()));
        return cubit;
      },
      act: (cubit) => cubit.loadQr(now),
      expect: () =>
          [const QrPageState.loadError(failure: CommonFailure.noInternet())],
    );
  });
  group('QRPageCubit seed refresh', () {
    const ttl = 2;
    const waitSeconds = 3;
    var firstTime = true;
    final seed = Seed(
      seed: '123456',
      expiresAt: now.add(const Duration(seconds: ttl)),
    );
    final seed2 = Seed(
      seed: '654321',
      expiresAt: now.add(const Duration(seconds: 2 * ttl, milliseconds: 400)),
    );

    blocTest<QrPageCubit, QrPageState>(
      'Fetches a seed succesfully, emits [QrPageState.loaded] 3 times' +
          'emits [QrPageState.loading] and finaly emits [QrPageState.loaded]',
      build: () {
        when(() => mockSeedGeneratorRepository.fetchSeed())
            .thenAnswer((invocation) async {
          if (firstTime) {
            firstTime = false;
            return right(seed);
          } else {
            return right(seed2);
          }
        });
        return cubit;
      },
      act: (cubit) => cubit.loadQr(now),
      wait: const Duration(seconds: waitSeconds, milliseconds: 400),
      expect: () => [
        QrPageState.loaded(seed: seed, ttl: ttl),
        QrPageState.loaded(seed: seed, ttl: ttl - 1),
        QrPageState.loaded(seed: seed, ttl: ttl - 2),
        const QrPageState.loading(),
        QrPageState.loaded(seed: seed2, ttl: ttl),
        QrPageState.loaded(seed: seed2, ttl: ttl - 1),
      ],
    );
  }, skip: false);
}
