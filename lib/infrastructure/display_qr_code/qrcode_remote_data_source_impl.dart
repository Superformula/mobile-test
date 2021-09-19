import 'dart:convert';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:superformula_mobile_test/domain/core/exceptions.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/i_qr_seed_remote_data_source.dart';
import 'package:superformula_mobile_test/infrastructure/display_qr_code/qr_seed_dto.dart';
import 'package:superformula_mobile_test/locator.dart';

@Injectable(as: IQrCodeRemoteDataSource)
class QrCodeRemoteDataSourceImpl implements IQrCodeRemoteDataSource {
  // TODO: SET CORRECT ENDPOINT
  final httpClient = locator<Client>();

  static final getSeedUri = Uri.parse(
      'https://httpbin.org/anything/{anything}?seed=d43397d129c3de9e4b6c3974c1c16d1f&expires_at=1979-11-12T13:10:42.24Z');

  @override
  Future<QrSeedDto> getQrCodeSeed() async {
    final response = await httpClient.get(getSeedUri);
    try {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        return QrSeedDto.fromJson(data['args'] as Map<String, dynamic>);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ResponseFormatException();
    }
  }

  @override
  Future<void> validateQrCodeData() async {
    // TODO: implement validateQrCodeData
    throw UnimplementedError();
  }
}
