import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:mobile_test/src/bloc/qr_code_generator_bloc.dart';
import 'package:mobile_test/src/services/seed_api_provider.dart';
import 'package:mobile_test/src/services/seed_respository.dart';
import 'package:mobile_test/src/utilities/navigator_util.dart';
import 'package:mockito/mockito.dart';

class MockSeedRepository extends Mock implements SeedRepository {}

class MockSeedApiProvider extends Mock implements SeedApiProvider {}

class MockCustomClient extends Mock implements BaseClient {}

class MockNavigatorUtil extends Mock implements NavigatorUtil {}

class MockQRCodeGeneratorBloc extends Mock implements QRCodeGeneratorBloc {}

class MockBuildContext extends Mock implements BuildContext {}

class MockBarcodeScanner extends Mock implements BarcodeScanner {}
