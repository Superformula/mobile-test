import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:errors/errors.dart';
import 'package:qr_generator/src/data/models/seed_model.dart';

/// Interface that set the contract for
/// getting remote seed data
abstract class IRemoteDataSource {
  /// Calls seed api endpoint.
  /// Thorws [ServerException] for all error codes
  Future<SeedModel> getSeed();
}

/// IRemoteDataSource implementation for getting seed object form api
class RemoteDataSource implements IRemoteDataSource {
  ///RemoteDataSource Constructor
  RemoteDataSource({
    @required Dio client,
    @required String url,
  })  : assert(client != null),
        assert(url != null),
        _client = client,
        _url = url;

  final Dio _client;
  final String _url;

  @override
  Future<SeedModel> getSeed() async {
    try {
      final result = await _client.get(_url);
      if (result.statusCode == 200) {
        return SeedModel.fromJson(result.data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
