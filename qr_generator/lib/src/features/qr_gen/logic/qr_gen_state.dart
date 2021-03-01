import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:qr_code_gen/qr_code_gen.dart' show QrPainter;

part 'qr_gen_state.freezed.dart';

/// Represents all the possible states in the QR generation feature
@freezed
abstract class QrGenState with _$QrGenState {
  /// Data is present
  const factory QrGenState.code({
    @required QrPainter qrPainter,
    @required DateTime expiration,
  }) = QRCode;

  /// Initial/default
  const factory QrGenState.initial() = Initial;

  /// Data is loading
  const factory QrGenState.loading() = Loading;

  /// Error when loading data
  const factory QrGenState.error([String message]) = Error;

  /// QR code expired
  const factory QrGenState.expired() = Expired;
}
