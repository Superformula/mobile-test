import 'package:flutter_test/flutter_test.dart';
import 'package:superformula_challenge/models/models.dart';
import 'package:superformula_challenge/repositories/repositories.dart';

import '../mock_adapter.dart';

void main() async {
  test('QR repository gets Seed object', () async {
    final qrRepository = QrRepository(httpClientAdapter: MockAdapter());

    var result = await qrRepository.getSeed();
    expect(result is Seed, true);
  });

  test('QR repository returns null upon timeout', () async {
    final qrRepository =
        QrRepository(httpClientAdapter: MockAdapter(timeout: true));

    var result = await qrRepository.getSeed();
    expect(result == null, true);
  });
}
