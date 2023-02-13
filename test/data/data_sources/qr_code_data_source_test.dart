import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:superformula_test/data/data_sources/qr_code_data_source.dart';
import 'package:superformula_test/data/errors/exception.dart';
import 'package:superformula_test/data/model/qr_code_model.dart';
import 'package:superformula_test/data/resources/api.dart';
import 'package:superformula_test/data/resources/api_response.dart';

class AppApiMock<Response> extends Mock implements AppApi<Response> {}

void main() {
  late final AppApi<Response> appApiMock;
  late final QRCodeDataSource qrCodeDataSource;

  setUpAll(() {
    appApiMock = AppApiMock();
    qrCodeDataSource = QRCodeDataSourceImpl(appApiMock);
  });

  group(
    'getSeed [METHOD]',
    () {
      test(
        'WHEN API returns successfully SHOULD return [QRCodeModel]',
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

          final response = await qrCodeDataSource.getSeed();

          expect(
            response,
            equals(
              QRCodeModel.fromJson(
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
            () async => await qrCodeDataSource.getSeed(),
            throwsA(isA<DataSourceException>()),
          );
        },
      );
    },
  );
}
