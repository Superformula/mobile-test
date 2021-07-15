import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matheus_massula_test/cubit/qr_code/cubit/qr_code_cubit.dart';
import 'package:matheus_massula_test/models/remote/qr_code_seed.dart';
import 'package:mockito/mockito.dart';

import '../mocks/qr_code_web_client_mock.dart';

void main() {
  
  blocTest(
    'emit [] on init',
    build: ()  => QrCodeCubit(qrCodeWebClient: QRCodeWebClientMock()),
    expect: () => [],
  );
  
  blocTest(
    'emit QrCodeLoaded when get QR Code Seed successfully',
    build: ()  {
      final QRCodeWebClientMock qrCodeWebClientMock = QRCodeWebClientMock();
      final cubit = QrCodeCubit(qrCodeWebClient: qrCodeWebClientMock);

      when(qrCodeWebClientMock.getQRCode()).thenAnswer(
        (_) async => QRCodeSeed(seed: 'random data', expiresAt: DateTime.now())
      );

      cubit.getQRCode();
      return cubit;
    },
    expect: () => [isA<QrCodeLoaded>()],
  );

  blocTest(
    'emit QrCodeError when don\'t get QR Code Seed successfully',
    build: ()  {
      final QRCodeWebClientMock qrCodeWebClientMock = QRCodeWebClientMock();
      final cubit = QrCodeCubit(qrCodeWebClient: qrCodeWebClientMock);

      when(qrCodeWebClientMock.getQRCode()).thenAnswer(
        (_) async => throw Exception()
      );

      cubit.getQRCode();
      return cubit;
    },
    expect: () => [isA<QrCodeError>()],
  );
}