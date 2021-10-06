import 'package:connectivity/connectivity.dart';
import 'package:mockito/annotations.dart';
import 'package:seed_reader/interactors/gateways/seed_api_gateway.dart';
import 'package:seed_reader/interactors/gateways/seed_local_gateway.dart';
import 'package:seed_reader/interactors/seed_interactor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'mock_generator.mocks.dart';

@GenerateMocks(<Type>[
  SeedInteractor,
  SeedLocalGateway,
  SeedApiGateway,
  MethodMocks,
  Connectivity,
  SharedPreferences,
])
void main() {}

class MethodMocks {
  Future<bool> futureBoolCallback() => Future<bool>.value(true);
}
