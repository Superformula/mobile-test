import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_app/blocs/seed_bloc.dart';
import 'package:qr_app/models/seed_data.dart';
import 'package:qr_app/repositories/seed_repository.dart';
import 'package:qr_app/route_names.dart';
import 'package:qr_app/services/services.dart';
import 'package:qr_app/utils/errors/http_error.dart';

class MockNavigationService extends Mock implements NavigationService {}

class MockLoggingService extends Mock implements LoggingService {}

class MockCacheService extends Mock implements CacheService {}

class MockSeedRepository extends Mock implements SeedRepository {}

final data = SeedData(
  seed: '123345',
  dateTime: DateTime.now()
      .add(
        Duration(seconds: 2),
      )
      .toIso8601String(),
);

final getIt = GetIt.instance;
void main() {
  final navigationService = MockNavigationService();
  final seedRepository = MockSeedRepository();
  final loggingService = MockLoggingService();
  final cacheService = MockCacheService();

  getIt.registerSingleton<NavigationService>(navigationService);
  getIt.registerSingleton<SeedRepository>(seedRepository);
  getIt.registerSingleton<LoggingService>(loggingService);
  getIt.registerSingleton<CacheService>(cacheService);

  setUp(() {
    reset(navigationService);
    reset(seedRepository);
    reset(loggingService);
    reset(cacheService);
  });

  test('QR Code (initial load)', () async {
    when(seedRepository.retrieve()).thenAnswer(
      (realInvocation) => Future.value(data),
    );
    final bloc = SeedBloc();
    await bloc.navToQRCode();
    await Future.delayed(Duration(seconds: 2));

    await expectLater(bloc.countDownValue, emits(0));
    await expectLater(bloc.seedData, emits(data));

    verify(navigationService.navigate(RouteNames.Code)).called(1);
    verify(seedRepository.retrieve()).called(2);

    bloc.dispose();
  });

  test('QR Code (database load)', () async {
    when(cacheService.retrieveAll())
        .thenAnswer((realInvocation) => Future.value([data]));
    when(seedRepository.retrieve()).thenAnswer(
      (realInvocation) => Future.error(
        HttpError(url: 'null', code: 500, message: "Server Error"),
      ),
    );

    final bloc = SeedBloc();
    final results = await bloc.retrieveSeedData();

    expect(data.seed, results.seed);

    verify(loggingService.information('HTTP failed',
        details: 'url: null,code: 500, message: Server Error, details: null'));
    verify(loggingService.information('Retieved from cache'));
    verify(seedRepository.retrieve()).called(1);
    verify(cacheService.retrieveAll()).called(1);

    bloc.dispose();
  });

  test('QR Code Error', () async {
    when(cacheService.retrieveAll()).thenAnswer(
      (realInvocation) => Future.error(
        "DB Error",
      ),
    );
    when(seedRepository.retrieve()).thenAnswer(
      (realInvocation) => Future.error(
        "Http Error",
      ),
    );

    final bloc = SeedBloc();
    await bloc.retrieveSeedData();

    await expectLater(bloc.countDownValue, emitsError("DB Error"));

    verify(loggingService.information('HTTP failed', details: 'Http Error'))
        .called(1);
    verify(loggingService.error("DB Error")).called(1);
    verify(seedRepository.retrieve()).called(1);
    verify(cacheService.retrieveAll()).called(1);

    bloc.dispose();
  });
  test('Scan', () async {
    final bloc = SeedBloc();
    bloc.navToScan();

    verify(navigationService.navigate(RouteNames.Scan)).called(1);
    bloc.dispose();
  });
}
