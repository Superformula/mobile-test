import 'package:flutter_test/flutter_test.dart';
import 'package:matheus_massula_test/models/remote/qr_code_seed.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/qr_code_web_client_mock.dart';

void main() {
  test('Should retrieve successfully QR Code Seed', () async {
    final QRCodeWebClientMock qrCodeWebClientMock = QRCodeWebClientMock();

    when(qrCodeWebClientMock.getQRCode()).thenAnswer(
      (_) async => QRCodeSeed(seed: 'random data', expiresAt: DateTime.now())
    );

    final result = qrCodeWebClientMock.getQRCode();

    expect(result, isA<Future<QRCodeSeed>>());
  });

  test('Should not retrieve QR Code Seed', () async {
    final QRCodeWebClientMock qrCodeWebClientMock = QRCodeWebClientMock();

    when(qrCodeWebClientMock.getQRCode()).thenAnswer(
      (_) async => throw Exception()
    );

    final result = qrCodeWebClientMock.getQRCode();

    expect(result, throwsA(isA<Exception>()));
  });
}