import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_app/blocs/seed_bloc.dart';
import 'package:qr_app/route_names.dart';
import 'package:qr_app/services/navigation_service.dart';

class MockNavigationService extends Mock implements NavigationService {}

final getIt = GetIt.instance;
void main() {
  final navigationService = MockNavigationService();
  getIt.registerSingleton<NavigationService>(navigationService);

  setUp(() {
    reset(navigationService);
  });

  group('Bloc Navigation', () {
    test('QR Code', () async {
      final bloc = SeedBloc();
      bloc.navToQRCode();

      verify(navigationService.navigate(RouteNames.Code)).called(1);
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
