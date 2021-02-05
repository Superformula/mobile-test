// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureCommon() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => GetSeedUseCase(c<SeedRepository>()));
    container.registerFactory<SeedRepository>(
        (c) => SeedRepositoryImpl(c<SeedRemoteClient>()));
  }

  @override
  void _configureProduction() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory<SeedRemoteClient>((c) => SeedRemoteClientImpl());
  }

  @override
  void _configureMocks() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory<SeedRemoteClient>((c) => FakeSeedApiClient());
  }
}
