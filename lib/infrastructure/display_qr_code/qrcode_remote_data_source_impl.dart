import 'dart:convert';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:superformula_mobile_test/domain/core/exceptions.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/i_qr_seed_remote_data_source.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/value_objects/qr_seed_data.dart';
import 'package:superformula_mobile_test/infrastructure/display_qr_code/qr_seed_dto.dart';
import 'package:superformula_mobile_test/locator.dart';

@Injectable(as: IQrCodeRemoteDataSource)
class QrCodeRemoteDataSourceImpl implements IQrCodeRemoteDataSource {
  final httpClient = locator<Client>();

  static final getSeedUri = Uri.parse(
      'https://luykkvtr61.execute-api.us-east-1.amazonaws.com/development/seed');
  @override
  Future<QrSeedDto> getQrCodeSeed() async {
    try {
      final response = await httpClient.get(getSeedUri);

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        return QrSeedDto.fromJson(data);
      } else {
        throw ServerException();
      }
    } on FormatException {
      throw ResponseFormatException();
    }
  }

  @override
  Future<bool> validateQrCodeData(String data) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    // Stub response, always return a valid response
    // will match every for every data that matches size
    if (data.length == seedValidLength) {
      return true;
    }
    return false;
  }
}
