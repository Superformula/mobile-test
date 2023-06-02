import 'package:qr_code/bootstrap.dart';
import 'package:qr_generator_api/qr_generator_api.dart';

Future<void> main() async {
  final qrCodeApi = QrGeneratorApi();
  boostrap(qrCodeApi: qrCodeApi);
}
