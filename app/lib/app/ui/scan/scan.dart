import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qrgenerator/app/intl/app_strings.dart';

Future<String> scanQRCode(BuildContext context) async {
  const String scanBarColor = "#661FFF";
  final strings = AppStrings.of(context);
  String result = await FlutterBarcodeScanner.scanBarcode(scanBarColor, strings.cancel, true);
  return result ?? "";
}
