import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:massula_test/cubit/qr_code/cubit/qr_code_cubit.dart';
import 'package:massula_test/models/remote/qr_code_seed.dart';
import 'package:mockito/mockito.dart';

import '../mocks/qr_code_web_client_mock.dart';

void main() {
  
  blocTest(
    'emit QrCodeLoaded when get QR Code Seed successfully',
    build: ()  {
      final QRCodeWebClientMock qrCodeWebClientMock = QRCodeWebClientMock();

      when(qrCodeWebClientMock.getQRCode()).thenAnswer(
        (_) async => QRCodeSeed(seed: 'random data', expiresAt: DateTime.now())
      );

      final cubit = QrCodeCubit(qrCodeWebClient: qrCodeWebClientMock);
      return cubit;
    },
    expect: () => [isA<QrCodeLoaded>()],
  );

  blocTest(
    'emit QrCodeError when don\'t get QR Code Seed successfully',
    build: ()  {
      final QRCodeWebClientMock qrCodeWebClientMock = QRCodeWebClientMock();
      final cubit = QrCodeCubit(qrCodeWebClient: qrCodeWebClientMock);
      return cubit;
    },
    expect: () => [isA<QrCodeError>()],
  );
}