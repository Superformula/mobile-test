import 'package:superformula_challenge/models/models.dart';
import 'package:superformula_challenge/repositories/repositories.dart';

import 'mock_adapter.dart';

class MockQrRepository extends QrRepository {
  final bool error;

  MockQrRepository({
    this.error = false,
  }) : super(httpClientAdapter: MockAdapter());

  @override
  Future getSeed() async {
    if (error) {
      return null;
    }
    return Seed(
      id: '24bc3',
      seed: 'foo',
      expiresAt: DateTime.now()..add(Duration(seconds: 30)),
    );
  }
}
