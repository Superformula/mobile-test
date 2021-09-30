import 'package:mocktail/mocktail.dart';
import 'package:qr_api/qr_api.dart';
import 'package:qr_api/src/api/api_result.dart';
import 'package:qr_models/qr_models.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

class MockQrApi extends Mock implements QrApi {}

void main() {
  group('SeedRepository::', () {
    late QrApi api;
    late SeedRepository seedRepository;

    setUp(() {
      api = MockQrApi();
      seedRepository = SeedRepositoryImpl(api);
    });

    test('can be instantiated', () {
      expect(seedRepository, isNotNull);
    });

    test(
      'when fetchSeed is successful, then return $ApiResult with $QRSeed',
      () async {
        final mockSeed = QRSeed('seed', 'expiresAt');
        final mockResult = ApiResult.success(mockSeed);
        when(() => api.fetchQrApi())
            .thenAnswer((invocation) async => mockResult);

        final result = await seedRepository.fetchSeed();
        final seed = result.whenOrNull(success: (data) => data);

        verify(() => api.fetchQrApi()).called(1);
        expect(seed?.toJson(), mockSeed.toJson());
      },
    );

    test(
      'when fetchSeed is a failure, then throw an $Exception',
      () async {
        final mockResult =
            ApiResult<QRSeed>.failure(Exception('Unexpected error'));
        when(() => api.fetchQrApi()).thenAnswer((_) async => mockResult);

        expect(
          await seedRepository
              .fetchSeed()
              .then((value) => value.whenOrNull(failure: (e) => e)),
          isA<Exception>(),
        );

        verify(() => api.fetchQrApi()).called(1);
      },
    );
  });
}
