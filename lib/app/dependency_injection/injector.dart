import 'package:kiwi/kiwi.dart';
import 'package:qrGenerator/data/mocks/fake_seed_api.dart';
import 'package:qrGenerator/data/repository_impl/remote_client/seed_remote_client_impl.dart';
import 'package:qrGenerator/data/repository_impl/seed_repository_impl.dart';
import 'package:qrGenerator/data/usecase/get_seed_usecase.dart';
import 'package:qrGenerator/domain/repository/seed_repository.dart';

part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer container;

  static final resolve = container.resolve;

  static void setup(bool isProduction) {
    container = KiwiContainer();
    var injector = _$Injector();

    injector._configureCommon();

    if (isProduction) {
      injector._configureProduction();
    } else {
      injector._configureMocks();
    }
  }

  //-------------------------------------------------------------------------------
  // Register Dependency Providers

  @Register.factory(GetSeedUseCase)
  @Register.factory(SeedRepository, from: SeedRepositoryImpl)
  void _configureCommon();

  @Register.factory(SeedRemoteClient, from: SeedRemoteClientImpl)
  void _configureProduction();

  @Register.factory(SeedRemoteClient, from: FakeSeedApiClient)
  void _configureMocks();
}