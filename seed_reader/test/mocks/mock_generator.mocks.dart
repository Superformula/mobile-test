// Mocks generated by Mockito 5.0.16 from annotations
// in seed_reader/test/mocks/mock_generator.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;
import 'dart:convert' as _i11;
import 'dart:typed_data' as _i12;

import 'package:connectivity/connectivity.dart' as _i9;
import 'package:http/http.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:seed_reader/interactors/gateways/seed_api_gateway.dart' as _i7;
import 'package:seed_reader/interactors/gateways/seed_local_gateway.dart'
    as _i6;
import 'package:seed_reader/interactors/seed_interactor.dart' as _i4;
import 'package:seed_reader/models/seed.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import 'mock_generator.dart' as _i8;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeSeed_0 extends _i1.Fake implements _i2.Seed {}

class _FakeResponse_1 extends _i1.Fake implements _i3.Response {}

class _FakeStreamedResponse_2 extends _i1.Fake implements _i3.StreamedResponse {
}

/// A class which mocks [SeedInteractor].
///
/// See the documentation for Mockito's code generation for more information.
class MockSeedInteractor extends _i1.Mock implements _i4.SeedInteractor {
  MockSeedInteractor() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Seed> fetchSeed() =>
      (super.noSuchMethod(Invocation.method(#fetchSeed, []),
              returnValue: Future<_i2.Seed>.value(_FakeSeed_0()))
          as _i5.Future<_i2.Seed>);
  @override
  bool isValid(_i2.Seed? seed) => (super
          .noSuchMethod(Invocation.method(#isValid, [seed]), returnValue: false)
      as bool);
  @override
  String toString() => super.toString();
}

/// A class which mocks [SeedLocalGateway].
///
/// See the documentation for Mockito's code generation for more information.
class MockSeedLocalGateway extends _i1.Mock implements _i6.SeedLocalGateway {
  MockSeedLocalGateway() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Seed?> fetchSeed() =>
      (super.noSuchMethod(Invocation.method(#fetchSeed, []),
          returnValue: Future<_i2.Seed?>.value()) as _i5.Future<_i2.Seed?>);
  @override
  _i5.Future<void> saveSeed(_i2.Seed? seed) =>
      (super.noSuchMethod(Invocation.method(#saveSeed, [seed]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [SeedApiGateway].
///
/// See the documentation for Mockito's code generation for more information.
class MockSeedApiGateway extends _i1.Mock implements _i7.SeedApiGateway {
  MockSeedApiGateway() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Seed> fetchSeed() =>
      (super.noSuchMethod(Invocation.method(#fetchSeed, []),
              returnValue: Future<_i2.Seed>.value(_FakeSeed_0()))
          as _i5.Future<_i2.Seed>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [MethodMocks].
///
/// See the documentation for Mockito's code generation for more information.
class MockMethodMocks extends _i1.Mock implements _i8.MethodMocks {
  MockMethodMocks() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<bool> futureBoolCallback() =>
      (super.noSuchMethod(Invocation.method(#futureBoolCallback, []),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [Connectivity].
///
/// See the documentation for Mockito's code generation for more information.
class MockConnectivity extends _i1.Mock implements _i9.Connectivity {
  MockConnectivity() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Stream<_i9.ConnectivityResult> get onConnectivityChanged =>
      (super.noSuchMethod(Invocation.getter(#onConnectivityChanged),
              returnValue: Stream<_i9.ConnectivityResult>.empty())
          as _i5.Stream<_i9.ConnectivityResult>);
  @override
  _i5.Future<_i9.ConnectivityResult> checkConnectivity() => (super.noSuchMethod(
          Invocation.method(#checkConnectivity, []),
          returnValue:
              Future<_i9.ConnectivityResult>.value(_i9.ConnectivityResult.wifi))
      as _i5.Future<_i9.ConnectivityResult>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [SharedPreferences].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferences extends _i1.Mock implements _i10.SharedPreferences {
  MockSharedPreferences() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Set<String> getKeys() => (super.noSuchMethod(Invocation.method(#getKeys, []),
      returnValue: <String>{}) as Set<String>);
  @override
  Object? get(String? key) =>
      (super.noSuchMethod(Invocation.method(#get, [key])) as Object?);
  @override
  bool? getBool(String? key) =>
      (super.noSuchMethod(Invocation.method(#getBool, [key])) as bool?);
  @override
  int? getInt(String? key) =>
      (super.noSuchMethod(Invocation.method(#getInt, [key])) as int?);
  @override
  double? getDouble(String? key) =>
      (super.noSuchMethod(Invocation.method(#getDouble, [key])) as double?);
  @override
  String? getString(String? key) =>
      (super.noSuchMethod(Invocation.method(#getString, [key])) as String?);
  @override
  bool containsKey(String? key) =>
      (super.noSuchMethod(Invocation.method(#containsKey, [key]),
          returnValue: false) as bool);
  @override
  List<String>? getStringList(String? key) =>
      (super.noSuchMethod(Invocation.method(#getStringList, [key]))
          as List<String>?);
  @override
  _i5.Future<bool> setBool(String? key, bool? value) =>
      (super.noSuchMethod(Invocation.method(#setBool, [key, value]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<bool> setInt(String? key, int? value) =>
      (super.noSuchMethod(Invocation.method(#setInt, [key, value]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<bool> setDouble(String? key, double? value) =>
      (super.noSuchMethod(Invocation.method(#setDouble, [key, value]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<bool> setString(String? key, String? value) =>
      (super.noSuchMethod(Invocation.method(#setString, [key, value]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<bool> setStringList(String? key, List<String>? value) =>
      (super.noSuchMethod(Invocation.method(#setStringList, [key, value]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<bool> remove(String? key) =>
      (super.noSuchMethod(Invocation.method(#remove, [key]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<bool> commit() =>
      (super.noSuchMethod(Invocation.method(#commit, []),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<bool> clear() => (super.noSuchMethod(Invocation.method(#clear, []),
      returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<void> reload() =>
      (super.noSuchMethod(Invocation.method(#reload, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i3.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i11.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i11.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i11.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i11.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<_i12.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i12.Uint8List>.value(_i12.Uint8List(0)))
          as _i5.Future<_i12.Uint8List>);
  @override
  _i5.Future<_i3.StreamedResponse> send(_i3.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i3.StreamedResponse>.value(_FakeStreamedResponse_2()))
          as _i5.Future<_i3.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}