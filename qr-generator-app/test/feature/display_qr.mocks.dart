// Mocks generated by Mockito 5.0.16 from annotations
// in qr_generator_app/test/feature/display_qr.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:qr_generator_app/model/qr_data.dart' as _i2;
import 'package:qr_generator_app/network/api.dart' as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeQrData_0 extends _i1.Fake implements _i2.QrData {}

/// A class which mocks [Api].
///
/// See the documentation for Mockito's code generation for more information.
class MockApi extends _i1.Mock implements _i3.Api {
  MockApi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.QrData> getSeed() =>
      (super.noSuchMethod(Invocation.method(#getSeed, []),
              returnValue: Future<_i2.QrData>.value(_FakeQrData_0()))
          as _i4.Future<_i2.QrData>);
  @override
  String toString() => super.toString();
}
