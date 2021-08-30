import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_generator/providers/bloc-provider.dart';
import 'package:qr_generator/services/app-backend-client.dart';

class QRScanningBloc implements Bloc {

  final AppBackendClient _backendClient;

  QRScanningBloc(this._backendClient);

  void dispose() {
    
  }

  Future<void> validateCode(Barcode capture) async {
    // TODO: Add endpoint integration to validate code;
    // CodeValidationResponse response = await _backendClient.validateCode(capture.code);
  }
}