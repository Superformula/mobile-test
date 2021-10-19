import 'package:mockito/annotations.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:massula_test/models/remote/qr_code_seed.dart';
import 'package:massula_test/services/http/qr_code_web_client.dart';

import '../mocks/client_mock.dart';

@GenerateMocks([Client])
void main() {
  test('Should retrieve successfully QR Code Seed', () async {
    final ClientMock clientMock = ClientMock();
    final QRCodeWebClient qrCodeWebClient = QRCodeWebClient(clientMock);

    final result = qrCodeWebClient.getQRCode();

    expect(result, isA<Future<QRCodeSeed?>>());
  });

  test('Should not retrieve QR Code Seed', () async {
    final ClientErrorMock clientMock = ClientErrorMock();
    final QRCodeWebClient qrCodeWebClientMock = QRCodeWebClient(clientMock);

    final result = qrCodeWebClientMock.getQRCode();

    expect(result, throwsA(isA<Exception>()));
  });
}