import 'package:dartz/dartz.dart';
import 'package:qr_generator/application/scan_page/scan_page_cubit.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:qr_generator/domain/i_seed_generator_repository.dart';
import 'package:qr_generator/domain/seed.dart';

class MockSeedGeneratorRepository extends Mock
    implements ISeedGeneratorRepository {}

void main() {
  late MockSeedGeneratorRepository mockSeedGeneratorRepository;
  late ScanPageCubit cubit;

  final seed = Seed(
    seed: '123456',
    expiresAt: DateTime.now().add(const Duration(seconds: 2)),
  );

  setUp(() {
    mockSeedGeneratorRepository = MockSeedGeneratorRepository();
    cubit = ScanPageCubit(mockSeedGeneratorRepository);
  });

  blocTest<ScanPageCubit, ScanPageState>(
    'Given a valid seed, When verifySeed is called' +
        'Then emits [ScanPageState.seedScanned, ScanPageState.seedVerified]',
    build: () {
      when(() => mockSeedGeneratorRepository.verifySeed(seed.seed))
          .thenAnswer((invocation) async => right(unit));
      return cubit;
    },
    act: (cubit) => cubit.codeObtained(seed.seed),
    expect: () => [
      ScanPageState.seedScanned(code: seed.seed),
      ScanPageState.seedVerified(code: seed.seed)
    ],
  );
}
