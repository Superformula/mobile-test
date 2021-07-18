import 'package:http/http.dart';
import 'package:qrcode_app/data/datasource/seeds_api_datasource.dart';
import 'package:qrcode_app/domain/entities/seed.dart';
import 'package:qrcode_app/domain/repository/seed_repository.dart';

class SeedRepositoryImpl implements SeedRepository {
  final SeedApiDatasource apiDatasource;
  Client client = Client();

  SeedRepositoryImpl(this.apiDatasource);
  @override
  Future<Seed> getSeed() async => apiDatasource.getSeed(client);
}
