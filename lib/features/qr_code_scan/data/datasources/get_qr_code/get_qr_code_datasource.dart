import 'package:superformula_leandro/features/qr_code_scan/data/models/qr_code_model.dart';

abstract interface class GetQrCodeDatasource {
  Future<QrCodeModel> call();
}
