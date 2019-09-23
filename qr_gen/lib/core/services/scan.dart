import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

abstract class ScanService {
  Future<String> scan();
}

class ScanServiceImplementation implements ScanService {
  scan() async {
    try {
      final qrCode = await BarcodeScanner.scan();

      return qrCode;
    } on PlatformException catch (e) {
      final serviceErrorCode = e.code == BarcodeScanner.CameraAccessDenied
          ? ScanServiceErrorCode.CameraAccessDenied
          : ScanServiceErrorCode.Unknown;

      throw ScanServiceError(serviceErrorCode);
    } on FormatException {
      throw ScanServiceError(ScanServiceErrorCode.Format, 'Canceled scan');
    } catch (e) {
      throw ScanServiceError(ScanServiceErrorCode.Unknown, 'Unknown error');
    }
  }
}

class ScanServiceError extends Error {
  final ScanServiceErrorCode code;
  final message;

  ScanServiceError(this.code, [this.message]);
  String toString() => "Scan service: $message";
}

enum ScanServiceErrorCode { Unknown, Format, CameraAccessDenied }
