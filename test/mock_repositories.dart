import 'package:dio/dio.dart';
import 'package:superformula_challenge/models/models.dart';
import 'package:superformula_challenge/repositories/repositories.dart';

import 'mock_adapter.dart';

class MockQrRepository extends QrRepository {
  final bool error;
  final bool invalidSeed;

  MockQrRepository({
    this.error = false,
    this.invalidSeed = false,
  }) : super(httpClientAdapter: MockAdapter());

  @override
  Future validateSeed({String seed}) async {
    if (error) {
      return DioError(error: 'error');
    }
    return !invalidSeed;
  }

  @override
  Future getSeed() async {
    if (error) {
      return DioError(error: 'error');
    }
    return Seed(
      id: '24bc3',
      seed: 'foo',
      expiresAt: DateTime.now()..add(Duration(seconds: 30)),
    );
  }
}
