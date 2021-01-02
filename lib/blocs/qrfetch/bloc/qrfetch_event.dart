import 'package:equatable/equatable.dart';
import 'package:qr_code_test/blocs/qrfetch/qrfetch.dart';

/// Events for the [QRFetchBloc] bloc
abstract class QRFetchEvent extends Equatable {
  const QRFetchEvent();

  @override
  List<Object> get props => [];
}

/// Event fired when the user is asking to get a new QR code on the screen
class FetchNewQR extends QRFetchEvent {
  const FetchNewQR();
}