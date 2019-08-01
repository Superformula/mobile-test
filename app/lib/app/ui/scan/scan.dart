import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrgenerator/app/intl/app_strings.dart';

class ScanException implements Exception {
  final String _message;

  const ScanException(this._message);

  @override
  String toString() => _message;
}

Future<String> scanQRCode(BuildContext context) async {
  final strings = AppStrings.of(context);
  try {
    String result = await BarcodeScanner.scan();
    return result ?? "";
  } on PlatformException catch (error) {
    if (error.code == BarcodeScanner.CameraAccessDenied) {
      throw ScanException(strings.scanErrorNoPermission);
    } else {
      throw ScanException(strings.scanError);
    }
  } on FormatException {
    throw ScanException(strings.scanErrorUserCancelled);
  } catch (e) {
    throw ScanException(strings.scanError);
  }
}
