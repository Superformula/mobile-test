import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:superformula_leandro/core/errors/exceptions/api_exception.dart';
import 'package:superformula_leandro/core/errors/exceptions/generic_exception.dart';
import 'package:superformula_leandro/features/qr_code_scan/data/datasources/get_qr_code/get_qr_code_datasource_impl.dart';
import 'package:superformula_leandro/features/qr_code_scan/data/models/qr_code_model.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/mocktail.dart';

void main() {
  group('GetQrCodeDatasourceImpl |', () {
    late GetQrCodeDatasourceImpl datasource;
    late MockDio mockDio;

    setUp(() {
      mockDio = MockDio();
      datasource = GetQrCodeDatasourceImpl(dio: mockDio);
    });

    test('should return a QrCodeModel', () async {
      when(() => mockDio.get(any())).thenAnswer(
        (_) async => Response(
          data: QrCodeScanMocks.qrCodeResponseMap,
          requestOptions: RequestOptions(),
        ),
      );
      final result = await datasource();
      expect(result, isA<QrCodeModel>());
    });
    test('should throw a ApiException', () async {
      when(() => mockDio.get(any())).thenThrow(
        DioException(requestOptions: RequestOptions()),
      );
      final result = datasource();
      expect(result, throwsA(isA<ApiException>()));
    });
    test('should throw a GenericException', () async {
      when(() => mockDio.get(any())).thenThrow(
        Exception(),
      );
      final result = datasource();
      expect(result, throwsA(isA<GenericException>()));
    });
  });
}
