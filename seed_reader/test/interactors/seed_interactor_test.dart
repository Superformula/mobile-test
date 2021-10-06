import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:seed_reader/errors.dart';
import 'package:seed_reader/interactors/seed_interactor.dart';
import 'package:seed_reader/models/seed.dart';
import '../mocks/mock_generator.mocks.dart';

late SeedInteractor _seedInteractor;
late MockSeedLocalGateway _seedLocalGateway;
late MockSeedApiGateway _seedApiGateway;
late MockMethodMocks _canFetchMock;
void main() {
  setUp(() {
    _seedLocalGateway = MockSeedLocalGateway();
    _seedApiGateway = MockSeedApiGateway();
    _canFetchMock = MockMethodMocks();
    _seedInteractor = SeedInteractor(
      canFetch: _canFetchMock.futureBoolCallback,
      seedLocalGateway: _seedLocalGateway,
      seedApiGateway: _seedApiGateway,
    );
  });

  group('#fetchSeed', () {
    test('when has a valid seed stored then return it', () async {
      final Seed seed = Seed(
        value: 'foo',
        expiration: DateTime.now(),
      );
      when(_seedLocalGateway.fetchSeed()).thenAnswer(
        (_) => Future<Seed>.value(seed),
      );

      expect(_seedInteractor.fetchSeed(), completion(seed));
    });
    test(
      'when the user cannot fetch due to connectivity then throw error',
      () async {
        when(_canFetchMock.futureBoolCallback()).thenAnswer(
          (_) => Future<bool>.value(false),
        );
        when(_seedLocalGateway.fetchSeed()).thenAnswer(
          (_) => Future<Seed?>.value(null),
        );
        expect(
          () => _seedInteractor.fetchSeed(),
          throwsA(isA<NotConnectedToFetchError>()),
        );
      },
    );
    test('when succeed to fetch then stores the new seed', () async {
      final Seed seed = Seed(
        value: 'foo',
        expiration: DateTime.now(),
      );
      when(_canFetchMock.futureBoolCallback()).thenAnswer(
        (_) => Future<bool>.value(true),
      );
      when(_seedLocalGateway.fetchSeed()).thenAnswer(
        (_) => Future<Seed?>.value(null),
      );
      when(_seedApiGateway.fetchSeed()).thenAnswer(
        (_) => Future<Seed>.value(seed),
      );

      expect(_seedInteractor.fetchSeed(), completion(seed));
    });

    test('when api fails to fetch then throws', () async {
      when(_canFetchMock.futureBoolCallback()).thenAnswer(
        (_) => Future<bool>.value(true),
      );
      when(_seedLocalGateway.fetchSeed()).thenAnswer(
        (_) => Future<Seed?>.value(null),
      );
      when(_seedApiGateway.fetchSeed()).thenAnswer(
        (_) => Future<Seed>.error(Error()),
      );

      expect(() => _seedInteractor.fetchSeed(), throwsA(isA<Error>()));
      verifyNever(_seedLocalGateway.saveSeed(null));
    });
  });

  test('#isValid', () async {
    expect(
      _seedInteractor.isValid(
        Seed(
          value: 'foo',
          expiration: DateTime.now(),
        ),
      ),
      false,
    );
    expect(
      _seedInteractor.isValid(
        Seed(
          value: 'bar',
          expiration: DateTime.now().add(
            const Duration(
              seconds: -3,
            ),
          ),
        ),
      ),
      false,
    );
    expect(
      _seedInteractor.isValid(
        Seed(
          value: 'foobar',
          expiration: DateTime.now().add(
            const Duration(
              seconds: 3,
            ),
          ),
        ),
      ),
      true,
    );
  });
}
