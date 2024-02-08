import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:superformula_leandro/features/qr_code_scan/data/datasources/get_qr_code/get_qr_code_datasource.dart';
import 'package:superformula_leandro/features/qr_code_scan/domain/repositories/get_qr_code_repository.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockQRViewController extends Mock implements QRViewController {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockRoute extends Fake implements Route {}

class MockGetQrCodeRepository extends Mock implements GetQrCodeRepository {}

class MockGetQrCodeDatasource extends Mock implements GetQrCodeDatasource {}

class MockDio extends Mock implements Dio {}
