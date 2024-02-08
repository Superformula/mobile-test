import 'package:flutter_test/flutter_test.dart';
import 'package:superformula_leandro/features/qr_code_scan/data/datasources/get_qr_code/get_qr_code_datasource_impl.dart';
import 'package:superformula_leandro/features/qr_code_scan/data/models/qr_code_model.dart';

void main() {
  group('GetQrCodeDatasourceImpl |', () {
    late GetQrCodeDatasourceImpl datasource;

    setUp(() {
      datasource = const GetQrCodeDatasourceImpl();
    });

    test('should return a QrCodeModel', () async {
      final result = await datasource();
      expect(result, isA<QrCodeModel>());
    });
  });
}
