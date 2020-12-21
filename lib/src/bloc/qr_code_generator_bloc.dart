import 'package:flutter/material.dart';
import 'package:mobile_test/src/model/seed.dart';
import 'package:mobile_test/src/services/respository.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rxdart/rxdart.dart';

class QRCodeGeneratorBloc {
  SeedRepository _seedRepository = SeedRepository();
  QRCodeGeneratorBloc({@required SeedRepository seedRepository})
      : assert(seedRepository != null),
        _seedRepository = seedRepository;

  final PublishSubject<QrImage> _seedFetcher = PublishSubject<QrImage>();
  final PublishSubject<String> _expiresAtFetcher = PublishSubject<String>();

  Observable<QrImage> get qrCodeSeed => _seedFetcher.stream;
  Observable<String> get qrCodeExpiresAt => _expiresAtFetcher.stream;

  Future<void> getGenerateQRCode() async {
    SeedResponse seedResponse = await _seedRepository.fetchSeed();
    final String _generatedQRCode =
        seedResponse.seed + '|' + seedResponse.expiresAt.toString();
    _seedFetcher.sink.add(QrImage(data: _generatedQRCode, size: 300.0));
    _expiresAtFetcher.sink.add(seedResponse.expiresAt);
  }

  bool checkQrCodeIsValid(String qrCodeData) {
    List<String> qrCodeDataParts = qrCodeData.split('|');
    DateTime expireAt = DateTime.parse(qrCodeDataParts[1]);
    DateTime currentDateTime = DateTime.now();
    return currentDateTime.isBefore(expireAt);
  }

  dispose() {
    _seedFetcher.close();
    _expiresAtFetcher.close();
  }
}

final QRCodeGeneratorBloc qrCodeBloc = QRCodeGeneratorBloc(
  seedRepository: SeedRepository(),
);
