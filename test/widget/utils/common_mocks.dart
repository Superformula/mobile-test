import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_test/blocs/countdown/countdown.dart';
import 'package:qr_code_test/blocs/qrfetch/qrfetch.dart';
import 'package:qr_code_test/blocs/slider/slider.dart';
import 'package:qr_code_test/blocs/validation/validation.dart';

/// Mock of the [CountdownBloc] bloc
class MockCountdownBloc extends MockBloc<CountdownBloc> implements CountdownBloc {}

/// Mock of the [QRFetchBloc] bloc
class MockQRFetchBloc extends MockBloc<QRFetchBloc> implements QRFetchBloc {}

/// Mock of the [ValidationBloc] bloc
class MockValidationBloc extends MockBloc<ValidationBloc> implements ValidationBloc {}

/// Mock of the [SliderBloc] bloc
class MockSliderBloc extends MockBloc<SliderBloc> implements SliderBloc {}

/// Mock of the [NavigatorObserver] class
class MockNavigatorObserver extends Mock implements NavigatorObserver {}