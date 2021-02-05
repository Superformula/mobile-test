import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qrGenerator/data/usecase/get_seed_usecase.dart';
import 'package:qrGenerator/domain/repository/seed_repository.dart';

class MockSeedRepository extends Mock implements SeedRepository {}

void main() {
  final seedRepository = MockSeedRepository();
  final seedUseCase = GetSeedUseCase(seedRepository);

  /// Simple get-seed test
  group('Get Seed Usecase tests',() {
    test('Seed usecase get-seed test', () {
      // when a call is made to get a seed
      seedUseCase.getSeed();

      // verify that the call is made on the seed repository
      verify(seedRepository.getSeed()).called(1);
    });
  });
}
