import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_generator/model/seed_model.dart';
import 'package:qr_generator/repositories/seed_repository.dart';

class MockRepository extends Mock implements SeedRepository {}

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
  });

  group(DioAdapter, () {
    test('closes itself by force', () async {
      dioAdapter.close();

      dioAdapter.onGet(
        '/route',
        (server) => server.reply(200, {'message': 'Success'}),
      );

      expect(
        () async => await dio.get('/route'),
        throwsA(
          predicate(
            (DioError dioError) => dioError.message.startsWith(
              'ClosedException',
            ),
          ),
        ),
      );
    });
  });

  group('Seed', () {
    test('should parse JSON correctly', () {
      final json = {
        'id': 'e6d15d1f-c558-441b-9a35-6c774261ec14',
        'expiresAt': '2021-11-03T23:17:35.229Z'
      };

      final seed = SeedModel.fromJson(json);

      expect(seed.id, json['id']);
      expect(seed.expiresAt, DateTime.parse(json['expiresAt'] as String));
    });
  });
}
