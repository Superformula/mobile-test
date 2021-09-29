// ignore_for_file: public_member_api_docs

import 'package:qr_api/qr_api.dart';
import 'package:qr_api/src/api/api_result.dart';
import 'package:qr_api/src/repository/seed_repository.dart';
import 'package:qr_models/qr_models.dart';

class SeedRepositoryImpl extends SeedRepository {
  SeedRepositoryImpl(this._api);

  final QrApi _api;

  @override
  Future<ApiResult<QRSeed>> fetchSeed() async {
    return _api.fetchQrApi();
  }
}
