import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_test/blocs/qrfetch/qrfetch.dart';

/// States for the [QRFetchBloc] bloc
abstract class QRFetchState extends Equatable {
  const QRFetchState();

  @override
  List<Object> get props => [];
}


/// Indicates that some QR processing is happening (for example, when the QR code
/// is being fetched and/or generated).
class QRLoading extends QRFetchState {
  const QRLoading();
}

/// The data for the QR code have properly been loaded
class QRLoaded extends QRFetchState {
  /// The [Seed] instance received from the HTTP request
  final Seed seed;
  /// The total remaining time (in seconds) to a refresh of the seed
  final int timeLeft;
  const QRLoaded({
    @required this.seed,
    @required this.timeLeft
  });

  @override
  List<Object> get props => [seed, timeLeft];
}

/// An error occurred while receiving the data
class QRError extends QRFetchState {
  const QRError();
}