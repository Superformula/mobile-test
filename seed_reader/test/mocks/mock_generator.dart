import 'package:mockito/annotations.dart';
import 'package:seed_reader/interactors/gateways/seed_api_gateway.dart';
import 'package:seed_reader/interactors/gateways/seed_local_gateway.dart';
import 'package:seed_reader/interactors/seed_interactor.dart';

@GenerateMocks(<Type>[
  SeedInteractor,
  SeedLocalGateway,
  SeedApiGateway,
  MethodMocks,
])
void main() {}

class MethodMocks {
  Future<bool> futureBoolCallback() => Future<bool>.value(true);
}
