import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_test/src/model/seed.dart';
import 'package:mobile_test/src/services/seed_respository.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rxdart/rxdart.dart';

class QRCodeGeneratorBloc {
  QRCodeGeneratorBloc({@required SeedRepository repository})
      : assert(repository != null),
        seedRepository = repository;

  SeedRepository seedRepository = SeedRepository();
  final BehaviorSubject<QrImage> seedFetcher = BehaviorSubject<QrImage>();

  final BehaviorSubject<String> expiresAtFetcher = BehaviorSubject<String>();

  ValueStream<QrImage> get qrCodeSeed$ => seedFetcher.stream;
  ValueStream<String> get qrCodeExpiresAt$ => expiresAtFetcher.stream;

  DateTime formatDatesToCompare(String date) {
    final DateTime parsedToDate = DateTime.parse(date);
    return DateTime.parse(
        DateFormat('yyyy-MM-dd hh:mm:ss').format(parsedToDate.toLocal()));
  }

  DateTime get getCurrentDateTime =>
      formatDatesToCompare(DateTime.now().toString());

  Future<void> getGenerateQRCode({SeedRepository seedRepository}) async {
    seedRepository ??= SeedRepository();
    final SeedResponse seedResponse = await seedRepository.fetchSeed();
    if (seedResponse.expiresAt != null && seedResponse.seed != null) {
      final DateTime parseDateCurrent =
          formatDatesToCompare(seedResponse.expiresAt);
      final String _generatedQRCode =
          seedResponse.seed + '##' + parseDateCurrent.toString();
      seedFetcher.sink.add(QrImage(data: _generatedQRCode, size: 300.0));
      expiresAtFetcher.add(parseDateCurrent.toString());
    }
  }

  //We can create this validation as the backend service if needed
  bool validateQrCodeStatus(String qrCodeData) {
    final List<String> qrCodeDataArray = qrCodeData.split('##');
    final DateTime expiresAtDateTime = formatDatesToCompare(qrCodeDataArray[1]);
    return getCurrentDateTime.isBefore(expiresAtDateTime) ||
        getCurrentDateTime.isAtSameMomentAs(expiresAtDateTime);
  }

  void dispose() {
    seedFetcher.close();
    expiresAtFetcher.close();
  }
}

final QRCodeGeneratorBloc qrCodeBloc = QRCodeGeneratorBloc(
  repository: SeedRepository(),
);
