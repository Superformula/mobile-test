import 'package:dio/dio.dart';
import 'package:errors/errors.dart';
import 'package:meta/meta.dart';

import '../../data.dart' show SeedModel;

import 'remote_data_source.dart';

///
/// * [DioDataSource]
///
class DioDataSource implements IRemoteDataSource {
  /// Implements the methods of a RemoteDataSource
  ///  using the [Dio] package.
  DioDataSource({
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
