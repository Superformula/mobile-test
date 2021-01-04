import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_test/blocs/qrfetch/qrfetch.dart';
import 'package:qr_code_test/configs/configurations.dart';

/// Bloc that handles the generation of a QR code starting from a string obtained
/// via HTTP request.
class QRFetchBloc extends Bloc<QRFetchEvent, QRFetchState> {
  /// The repository needed to get the seed for the QR code
  final QRRepository repository;

  /// A [repository] is required to fetch the seed for the QR code
  QRFetchBloc({
    @required this.repository
  }) : super(const QRLoading());

  @override
  Stream<QRFetchState> mapEventToState(QRFetchEvent event) async* {
    if (event is FetchNewQR) {
      yield* _mapEventToFetchNewQR(event);
    }
  }

  Stream<QRFetchState> _mapEventToFetchNewQR(FetchNewQR event) async* {
    yield const QRLoading();

    try {
      // Adding a 'fake' wait so that a loading spinner appears on the UI. This
      // is just for this demo interview to show the loader!
      //
      // Without this the loading spinner doesn't always appear.
      await Future.delayed(const Duration(seconds: 1));

      // Getting the 'Seed' instance
      final data = await repository.getData(
        dio: Configurations.dioHttpClientQR
      );

      // Calculating the total time left
      final expireDate = DateTime.parse(data.expiryDate);
      final now = DateTime.now();
      final diff = expireDate.difference(now).inSeconds;

      // Returning the state
      yield QRLoaded(
        seed: data,
        timeLeft: diff
      );
    } on Exception {
      yield const QRError();
    }
  }
}