import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_gen/qr_gen.dart';
import 'package:test/test.dart';

class MockRepository extends Mock implements QrGenRepository {}

void main() {
  MockRepository repository;
  GetSeed usecase;

  setUp(() {
    repository = MockRepository();
    usecase = GetSeed(repository: repository);
  });

  group('GetSeed usecase', () {
    final tSeed = SeedModel(
      seed: 'myRandomSeed',
      expiresAt: DateTime.now().add(const Duration(seconds: 30)),
    );

    test(
      'Should get seed using repository.',
      () async {
        // setup -> create the object to test
        when(repository.getSeed()).thenAnswer((_) async => Right(tSeed));
        // side effects -> collect the result to test
        final result = await usecase();
        // expectations -> compare result to expected value
        expect(result, equals(Right(tSeed)));
        // verifications -> verify other actions that should(n't) happen
        verify(repository.getSeed());
        verifyNoMoreInteractions(repository);
      },
    );
    test(
      'Should return failure using repository.',
      () async {
        // setup -> create the object to test
        when(
          repository.getSeed(),
        ).thenAnswer((_) async => Left(ServerFailure()));
        // side effects -> collect the result to test
        final result = await usecase();
        // expectations -> compare result to expected value
        expect(result, equals(Left(ServerFailure())));
        // verifications -> verify other actions that should(n't) happen
        verify(repository.getSeed());
        verifyNoMoreInteractions(repository);
      },
    );
  });
}
