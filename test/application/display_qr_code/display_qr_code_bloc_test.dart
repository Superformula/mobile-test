import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superformula_mobile_test/application/display_qr_code/display_qr_code_bloc.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/entities/qr_seed.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/qr_seed_failure.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/value_objects/qr_seed_data.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/value_objects/qr_seed_expiration_date.dart';

import '../../setup/test_helpers.dart';

void main() {
  group('DisplayQrCodeBlocTest -', () {
    setUp(registerServices);
    tearDown(unregisterServices);

    const seed = '1';
    const expirationDate = '2020-01-01T00:00:00Z';
    final qrCode = QrSeed(
        seed: QrSeedData(seed),
        expiresAt: QrSeedExpirationDate.withString(expirationDate));
    const qrCodeFailure = QrSeedFailure.serverFailure();

    group('requestedNewQrCode -', () {
      test('should get data from the repository', () async {
        // arrange
        final mockRepository = getAndRegisterIQrSeedRepository();
        final mockNetworkInfo = getAndRegisterNetworkInfo();
        final bloc = DisplayQrCodeBloc(mockRepository, mockNetworkInfo);

        // act
        bloc.add(const DisplayQrCodeEvent.requestedNewQrCode());
        await untilCalled(mockRepository.getQrCodeSeed());

        // assert
        verify(mockRepository.getQrCodeSeed());
      });

      test(
          'When data is retrieved successfully, emits [DisplayQrCodeState.loadInProgress, DisplayQrCodeState.loadSuccess]',
          () async {
        // arrange
        final bloc = DisplayQrCodeBloc(
            getAndRegisterIQrSeedRepository(), getAndRegisterNetworkInfo());

        // assert later
        final expected = [
          const DisplayQrCodeState.loadInProgress(),
          DisplayQrCodeState.loadSuccess(qrCode)
        ];

        // ignore: unawaited_futures
        expectLater(bloc.stream, emitsInOrder(expected));

        // act
        bloc.add(const DisplayQrCodeEvent.requestedNewQrCode());
      });

      test(
          'When data is not retrieved, emits [DisplayQrCodeState.loadInProgress, DisplayQrCodeState.loadFailure]',
          () async {
        // arrange
        final bloc = DisplayQrCodeBloc(
            getAndRegisterIQrSeedRepository(failure: qrCodeFailure),
            getAndRegisterNetworkInfo());

        // assert later
        const expected = [
          DisplayQrCodeState.loadInProgress(),
          DisplayQrCodeState.loadFailure(qrCodeFailure)
        ];

        // ignore: unawaited_futures
        expectLater(bloc.stream, emitsInOrder(expected));

        // act
        bloc.add(const DisplayQrCodeEvent.requestedNewQrCode());
      });
    });

    group('qrCodeExpired -', () {
      test('When we are connected to the internet, request a new qrcode',
          () async {
        // arrange
        final mockRepository = getAndRegisterIQrSeedRepository();
        final networkInfo = getAndRegisterNetworkInfo();
        final bloc = DisplayQrCodeBloc(mockRepository, networkInfo);

        // assert later
        final expected = [
          const DisplayQrCodeState.loadInProgress(),
          DisplayQrCodeState.loadSuccess(qrCode),
        ];
        // ignore: unawaited_futures
        expectLater(bloc.stream, emitsInOrder(expected));

        // act
        bloc.add(const DisplayQrCodeEvent.qrCodeExpired());
        await untilCalled(mockRepository.getQrCodeSeed());

        // assert
        verify(networkInfo.isConnected);
        verify(mockRepository.getQrCodeSeed());
      });

      test('When we are not connected to the internet, do not request',
          () async {
        // arrange
        final mockRepository = getAndRegisterIQrSeedRepository();
        final networkInfo = getAndRegisterNetworkInfo(isConnected: false);
        final bloc = DisplayQrCodeBloc(mockRepository, networkInfo);

        // act
        bloc.add(const DisplayQrCodeEvent.qrCodeExpired());
        await untilCalled(networkInfo.isConnected);

        // assert
        verify(networkInfo.isConnected);
        verifyNever(mockRepository.getQrCodeSeed());
      });
    });
  });
}
