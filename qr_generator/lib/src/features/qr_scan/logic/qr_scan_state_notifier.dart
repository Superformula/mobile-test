part of 'qr_scan_provider.dart';

/// Defines all the QrScan logic the app will use
class QrScanNotifier extends StateNotifier<QrScanState> {
  /// Base constructor expects a  its usecases and also defines inital state
  QrScanNotifier() : super(const QrScanState.initial());

  /// Adding a new scan to state. Can have previous decoded strings.
  void addScan(String decode) {
    state.maybeWhen(
      scanned: (decodedStrings) {
        state = Scanned(decodedStrings: [...decodedStrings, decode]);
      },
      orElse: () => state = Scanned(decodedStrings: [decode]),
    );
  }
}
