import 'package:http/http.dart' as http;

import 'package:superformula_test/core/data/repositories/qr_code_repo/qr_repo_interface.dart';

class QrRepository implements QrRepositoryInterface{
  @override
  Future<String> getSeed() {
    // TODO: implement getSeed
    throw UnimplementedError();
  }

  @override
  Future<bool> validateQrCode() {
    // TODO: implement validateQrCode
    throw UnimplementedError();
  }

}