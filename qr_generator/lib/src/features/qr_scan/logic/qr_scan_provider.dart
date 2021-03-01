import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../views/qr_scan_page.i18n.dart';

import 'qr_scan_state.dart';

part 'qr_scan_state_notifier.dart';

/// [StateNotifierProvider] to use the [QrScanNotifier].
final qrScanNotifierProvider = StateNotifierProvider(
  (_) => QrScanNotifier(),
);

/// [FutureProvider] used to get a [Future<String>]
/// containing data in a QR code.
/// Adds the [String] to [Scanned] state.
final scanQRCode = FutureProvider.autoDispose<void>(
  (ref) async {
    final scanResult = await FlutterBarcodeScanner.scanBarcode(
      '#FF5722',
      kCancelMessage.i18n,
      false,
      ScanMode.QR,
    );

    if (scanResult != '-1') {
      ref.watch(qrScanNotifierProvider).addScan(scanResult);
    }
  },
);
