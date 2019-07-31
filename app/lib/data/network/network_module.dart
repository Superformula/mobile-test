import 'package:dependencies/dependencies.dart';
import 'package:qrgenerator/core/env/env.dart';
import 'package:qrgenerator/data/network/mock_seed_repository.dart';
import 'package:qrgenerator/data/network/network_seed_repository.dart';
import 'package:qrgenerator/domain/abstractions/seed_repository.dart';

///
/// Install Network implementations.
///
class NetworkModule implements Module {
  final Flavor _flavor;

  NetworkModule(this._flavor);

  @override
  void configure(Binder binder) {
    if (_flavor == Flavor.develop) {
      binder.bindLazySingleton<SeedRepository>((injector, params) {
        return MockSeedRepository();
      });
    } else {
      binder.bindLazySingleton<SeedRepository>((injector, params) {
        return NetworkSeedRepository();
      });
    }
  }
}
