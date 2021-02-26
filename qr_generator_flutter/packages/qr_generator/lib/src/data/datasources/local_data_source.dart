import 'package:uuid/uuid.dart';
import 'package:errors/errors.dart';

import '../models/seed_model.dart';

/// Interface that get cached [SeedModel] when the user is offline.
abstract class ILocalDataSource {
  ///Get a local generated seed
  Future<SeedModel> getLocalGeneratedSeed();
}

/// `ILocaDataSource` implementation
class LocalDataSource implements ILocalDataSource {
  @override
  Future<SeedModel> getLocalGeneratedSeed() {
    final uuid = Uuid();
    final seed = uuid.v4();
    final expirationDate = DateTime.now().add(const Duration(seconds: 15));

    if (seed != null) {
      return Future.value(
        SeedModel(seed: 'Locally generate: $seed', expiresAt: expirationDate),
      );
    } else {
      throw CacheException();
    }
  }
}
