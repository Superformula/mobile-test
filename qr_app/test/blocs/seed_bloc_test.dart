import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_app/blocs/seed_bloc.dart';
import 'package:qr_app/models/seed_data.dart';
import 'package:qr_app/repositories/seed_repository.dart';
import 'package:qr_app/route_names.dart';
import 'package:qr_app/services/navigation_service.dart';

class MockNavigationService extends Mock implements NavigationService {}

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
  getIt.registerSingleton<NavigationService>(navigationService);
  getIt.registerSingleton<SeedRepository>(seedRepository);

  setUp(() {
    reset(navigationService);
    reset(seedRepository);
  });

  group('Bloc Navigation', () {
    test('QR Code (initial load)', () async {
      when(seedRepository.retrieve()).thenAnswer(
        (realInvocation) => Future.value(data),
      );
      final bloc = SeedBloc();
      await bloc.navToQRCode();
      await Future.delayed(Duration(seconds: 1));

      await expectLater(bloc.countDownValue, emits(0));
      await expectLater(bloc.seedData, emits(data));

      verify(navigationService.navigate(RouteNames.Code)).called(1);
      verify(seedRepository.retrieve()).called(1);

      bloc.dispose();
    });

    test('Scan', () async {
      final bloc = SeedBloc();
      bloc.navToScan();

      verify(navigationService.navigate(RouteNames.Scan)).called(1);
      bloc.dispose();
    });
  });
}
