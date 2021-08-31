import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:superformula_test/core/data/models/qr_model.dart';

import 'package:superformula_test/core/data/repositories/qr_code_repo/qr_repo_interface.dart';
import 'package:superformula_test/core/services/http_service/http_service.dart';

class QrRepository with HttpServiceMixin implements QrRepositoryInterface {
  @override
  Future<QrModel> getSeed() async {
    final response = await httpService.get('/default/random-qr-seed_seed');

    print(response.body);
    return QrModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<bool> validateQrCode(String code) async {
    //should hypothetically send to server to validate
    return true;
  }
}
