import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_scan_state.freezed.dart';

/// Represents all the possible states in the scan feature
@freezed
abstract class QrScanState with _$QrScanState {
  /// A QR was succesfully scanned
  const factory QrScanState.scanned({
    @required List<String> decodedStrings,
  }) = Scanned;

  /// Initial/default state
  const factory QrScanState.initial() = Initial;

  /// Error when loading data state
  const factory QrScanState.error([String message]) = Error;
}
