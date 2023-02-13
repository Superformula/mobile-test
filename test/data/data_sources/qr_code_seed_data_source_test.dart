import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:superformula_test/data/data_sources/qr_code_seed_data_source.dart';
import 'package:superformula_test/data/errors/exception.dart';
import 'package:superformula_test/data/model/qr_code_seed_model.dart';
import 'package:superformula_test/data/resources/api.dart';
import 'package:superformula_test/data/resources/api_response.dart';

class AppApiMock<Response> extends Mock implements AppApi<Response> {}

void main() {
  late final AppApi<Response> appApiMock;
  late final QrCodeSeedDataSource qrCodeSeedDataSource;

  setUpAll(() {
    appApiMock = AppApiMock();
    qrCodeSeedDataSource = QrCodeSeedDataSourceImpl(appApiMock);
  });

  group(
    'getSeed [METHOD]',
    () {
      test(
        'WHEN API returns successfully SHOULD return [QrCodeSeedModel]',
        () async {
          final apiResponse = ApiResponse(
            response: Response(
              data: {
                'content': {
                  'seed': 'Testing',
                  'expires_at': '',
                },
              },
              requestOptions: RequestOptions(path: '/seed'),
            ),
          );

          when(() => appApiMock.get(any()))
              .thenAnswer((_) async => apiResponse);

          final response = await qrCodeSeedDataSource.getSeed();

          expect(
            response,
            equals(
              QrCodeSeedModel.fromJson(
                apiResponse.response.data!['content']!,
              ),
            ),
          );
        },
      );

      test(
        'WHEN API returns failure SHOULD throw [DataSourceException]',
        () async {
          when(() => appApiMock.get(any())).thenThrow(
            DioError(requestOptions: RequestOptions(path: '')),
          );

          expect(
            () async => await qrCodeSeedDataSource.getSeed(),
            throwsA(isA<DataSourceException>()),
          );
        },
      );
    },
  );
}
