import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:qr_test/controller/api/networking.dart';

import 'package:qr_test/model/constants.dart';
import 'package:qr_test/model/data_seed.dart';

class MockClient extends Mock implements Client {}

Future<void> main() async {
  MockClient client = MockClient();
  NetworkingImpl networkingImpl = NetworkingImpl(client: client);

  test('networking ...', () async {
    when(() => client.get(Uri.parse(testUrl), headers: {"x-api-key": testKey}))
        .thenAnswer((invocation) async => Response(
            '{"data": "some random string", "expiresAt": "2021-11-30"}', 200));
  });

  var result = await networkingImpl.getSeed();

  expect(result, DataSeed(data: "some random string", expiresAt: "2021-11-30"));
}
