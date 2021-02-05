import 'package:mockito/mockito.dart';
import 'package:qrGenerator/data/repository_impl/remote_client/seed_remote_client_impl.dart';
import 'package:qrGenerator/domain/models/seed.dart';

/// Used to inject dummy data to simulate a Server
class FakeSeedApiClient extends Fake implements SeedRemoteClient {

  /// Fake a Seed object returned from a remote server
  @override
  Future<Seed> getSeed() {
    var seed = Seed(
      seed: 'abcdefghijklmnopqrstuvwxyz',
      expiresAt: DateTime.now().add(Duration(seconds: 120))
    );
    return Future.value(seed);
  }
}