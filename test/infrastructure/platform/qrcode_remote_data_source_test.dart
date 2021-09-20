import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superformula_mobile_test/domain/core/exceptions.dart';
import 'package:superformula_mobile_test/infrastructure/display_qr_code/qr_seed_dto.dart';
import 'package:superformula_mobile_test/infrastructure/display_qr_code/qrcode_remote_data_source_impl.dart';

import '../../setup/test_helpers.dart';

QrCodeRemoteDataSourceImpl get dataSource => QrCodeRemoteDataSourceImpl();

void main() {
  group('QrCodeRemoteDataSourceTest -', () {
    setUp(registerServices);
    tearDown(unregisterServices);
  });

  group('getQrCodeSeed', () {
    final tQRCodeModel = QrSeedDto.fromJson(jsonDecode(fixture('simple_qrseed.json')) as Map<String, dynamic>);

    test(
      'should preform a GET request on a URL with *seed* endpoint with application/json header',
      () async {
        //arrange
        final mockHttpClient = getAndRegisterClient();

        // act
        await dataSource.getQrCodeSeed();

        // assert
        verify(mockHttpClient.get(QrCodeRemoteDataSourceImpl.getSeedUri));
      },
    );

    test(
      'should return QrSeedDto when the response code is 200 (success)',
      () async {
        // arrange
        getAndRegisterClient();

        // act
        final result = await dataSource.getQrCodeSeed();

        // assert
        expect(result, equals(tQRCodeModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        getAndRegisterClient(statusCode: 404);
        // act
        final call = dataSource.getQrCodeSeed;
        // assert
        expect(call, throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });
}
