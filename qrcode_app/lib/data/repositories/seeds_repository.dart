import 'package:http/http.dart';
import 'package:qrcode_app/data/datasource/seeds_api_datasource.dart';
import 'package:qrcode_app/domain/entities/seed.dart';

abstract class SeedRepository {
  Future<Seed> getSeed();
}

class SeedRepositoryImpl implements SeedRepository {
  Client client = Client();
  @override
  Future<Seed> getSeed() async => SeedApiDatasource.getSeed(client);
}
