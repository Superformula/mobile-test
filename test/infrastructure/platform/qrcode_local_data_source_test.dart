import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superformula_mobile_test/domain/core/exceptions.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/i_qr_seed_local_data_source.dart';
import 'package:superformula_mobile_test/infrastructure/display_qr_code/qr_seed_dto.dart';
import 'package:superformula_mobile_test/infrastructure/display_qr_code/qrcode_local_data_source_impl.dart';

import '../../setup/test_helpers.dart';

QrCodeLocalDataSource get dataSource => QrCodeLocalDataSource();

void main() {
  group('QRCodeLocalDataSourceTest -', () {
    setUp(registerServices);
    tearDown(unregisterServices);
  });

  group('getLastQrSeed -', () {
    final tQRCodeModel = QrSeedDto.fromJson(json.decode(fixture('simple_qrseed.json')) as Map<String, dynamic>);
    test(
      'should return QrSeedDto from SharedPreferences when there is one in the cache',
      () async {
        // arrange
        final mockSharedPreferences = getAndRegisterSharedPreferences();

        // act
        final result = await dataSource.getLastQrSeed();

        // assert
        verify(mockSharedPreferences.getString(IQrCodeLocalDataSource.cachedQRCode));
        expect(result, equals(tQRCodeModel));
      },
    );

    test('should throw a CacheException when there is not a cached value', () {
      // arrange
      getAndRegisterSharedPreferences(hasCachedNumberTrivia: false);

      // act

      // Not calling the method here, just storing it inside a call variable
      final call = dataSource.getLastQrSeed;

      // assert
      // Calling the method happens from a higher-order function passed.
      // This is needed to test if calling a method throws an exception.
      expect(call, throwsA(const TypeMatcher<CacheException>()));
    });
  });

  group('cacheQrSeed', () {
    const tNumberTriviaModel = QrSeedDto(seed: '1', expiresAt: '2020-01-01');

    test('should call SharedPreferences to cache the data', () {
      // arrange
      final mockSharedPreferences = getAndRegisterSharedPreferences();

      // act
      dataSource.cacheQrSeed(tNumberTriviaModel);

      // assert
      final expectedJsonString = json.encode(tNumberTriviaModel.toJson());
      verify(mockSharedPreferences.setString(IQrCodeLocalDataSource.cachedQRCode, expectedJsonString));
    });
  });
}
