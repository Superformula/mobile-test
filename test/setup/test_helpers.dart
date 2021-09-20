import 'dart:io';

import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superformula_mobile_test/domain/core/either.dart';
import 'package:superformula_mobile_test/domain/core/exceptions.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/entities/qr_seed.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/i_qr_seed_local_data_source.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/i_qr_seed_remote_data_source.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/i_qr_seed_repository.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/qr_seed_failure.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/value_objects/qr_seed_data.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/value_objects/qr_seed_expiration_date.dart';
import 'package:superformula_mobile_test/domain/platform/i_network_info.dart';
import 'package:superformula_mobile_test/infrastructure/display_qr_code/qr_seed_dto.dart';
import 'package:superformula_mobile_test/infrastructure/platform/data_connection_checker.dart';
import 'package:superformula_mobile_test/locator.dart';

import 'test_helpers.mocks.dart';

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();

@GenerateMocks([], customMocks: [
  // If we don't supply returnNullOnMissingStub then we'll get an exception when
  // a non-stubbed method is called.
  MockSpec<IQrSeedRepository>(returnNullOnMissingStub: true),
  MockSpec<IQrCodeRemoteDataSource>(returnNullOnMissingStub: true),
  MockSpec<IQrCodeLocalDataSource>(returnNullOnMissingStub: true),
  MockSpec<INetworkInfo>(returnNullOnMissingStub: true),

  // External packages
  MockSpec<DataConnectionChecker>(returnNullOnMissingStub: true),
  MockSpec<SharedPreferences>(returnNullOnMissingStub: true),
  MockSpec<Client>(returnNullOnMissingStub: true),
])
IQrSeedRepository getAndRegisterIQrSeedRepository(
    {QrSeedFailure? failure, String data = '1', bool isValid = true}) {
  _removeRegistrationIfExists<IQrSeedRepository>();
  final service = MockIQrSeedRepository();
  locator.registerSingleton<IQrSeedRepository>(service);
  if (failure != null) {
    when(service.getQrCodeSeed())
        .thenAnswer((realInvocation) async => Either.left(failure));
    when(service.validateQrCodeData(data))
        .thenAnswer((realInvocation) async => Either.left(failure));
  } else {
    when(service.getQrCodeSeed())
        .thenAnswer((realInvocation) async => Either.right(QrSeed(
              seed: QrSeedData('1'),
              expiresAt:
                  QrSeedExpirationDate.withString('2020-01-01T00:00:00Z'),
            )));
    when(service.validateQrCodeData(data))
        .thenAnswer((realInvocation) async => Either.right(isValid));
  }
  return service;
}

IQrCodeRemoteDataSource getAndRegisterQRCodeRemoteDataSource(
    {QrSeedDto? qrcodeDTO}) {
  _removeRegistrationIfExists<IQrCodeRemoteDataSource>();
  final service = MockIQrCodeRemoteDataSource();
  if (qrcodeDTO != null) {
    when(service.getQrCodeSeed())
        .thenAnswer((realInvocation) async => qrcodeDTO);
  } else {
    when(service.getQrCodeSeed()).thenThrow(ServerException());
  }
  locator.registerSingleton<IQrCodeRemoteDataSource>(service);
  return service;
}

IQrCodeLocalDataSource getAndRegisterQRCodeLocalDataSource(
    {QrSeedDto? cached, QrSeedDto? qrcodeToCache}) {
  _removeRegistrationIfExists<IQrCodeLocalDataSource>();
  final service = MockIQrCodeLocalDataSource();
  if (cached != null) {
    when(service.getLastQrSeed()).thenAnswer((realInvocation) async => cached);
  } else {
    when(service.getLastQrSeed()).thenThrow(CacheException());
  }
  locator.registerSingleton<IQrCodeLocalDataSource>(service);
  return service;
}

INetworkInfo getAndRegisterNetworkInfo({bool isConnected = true}) {
  _removeRegistrationIfExists<INetworkInfo>();
  final service = MockINetworkInfo();
  when(service.isConnected).thenAnswer((realInvocation) async => isConnected);
  locator.registerSingleton<INetworkInfo>(service);
  return service;
}

DataConnectionChecker getAndRegisterDataConnectionChecker(
    {Future<bool>? hasConnectionFuture}) {
  _removeRegistrationIfExists<DataConnectionChecker>();
  final service = MockDataConnectionChecker();
  when(service.hasConnection).thenAnswer(
      (realInvocation) => hasConnectionFuture ?? Future.value(true));
  locator.registerSingleton<DataConnectionChecker>(service);
  return service;
}

SharedPreferences getAndRegisterSharedPreferences(
    {bool hasCachedNumberTrivia = true}) {
  _removeRegistrationIfExists<SharedPreferences>();
  final service = MockSharedPreferences();
  if (hasCachedNumberTrivia) {
    when(service.getString(any)).thenReturn(fixture('simple_qrseed.json'));
  } else {
    when(service.getString(any)).thenThrow(CacheException());
  }
  when(service.setString(any, any)).thenAnswer((realInvocation) async => true);
  locator.registerSingleton<SharedPreferences>(service);
  return service;
}

Client getAndRegisterClient({int statusCode = 200}) {
  _removeRegistrationIfExists<Client>();
  final service = MockClient();
  when(service.get(any)).thenAnswer(
    (realInvocation) async =>
        Response(fixture('simple_qrseed.json'), statusCode),
  );
  locator.registerSingleton<Client>(service);
  return service;
}

void registerServices() {
  getAndRegisterIQrSeedRepository();
  getAndRegisterQRCodeRemoteDataSource();
  getAndRegisterQRCodeLocalDataSource();
  getAndRegisterNetworkInfo();
  getAndRegisterDataConnectionChecker();
  getAndRegisterSharedPreferences();
  getAndRegisterClient();
}

void unregisterServices() {
  locator.unregister<IQrSeedRepository>();
  locator.unregister<IQrCodeRemoteDataSource>();
  locator.unregister<IQrCodeLocalDataSource>();
  locator.unregister<INetworkInfo>();
  locator.unregister<DataConnectionChecker>();
  locator.unregister<SharedPreferences>();
  locator.unregister<Client>();
}

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
