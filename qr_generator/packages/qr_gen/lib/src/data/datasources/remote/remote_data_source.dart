import '../../../domain/entities/seed.dart';

///
/// * Interface to create remote data source implementations.
///
abstract class IRemoteDataSource {
  /// Gets a [Seed] from any remote service.
  Future<Seed> getSeed();
}
