import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_test/blocs/qrfetch/qrfetch.dart';
import 'package:test/test.dart';

class HttpQRRepositoryMock extends Mock implements HttpQRRepository {}
class MockDioClient extends Mock implements Dio {}

void main() {
  QRFetchBloc qrFetchBloc;
  HttpQRRepository mockHttpRepository;

  setUp(() {
    // Mock repository used to return fake HTTP responses
    mockHttpRepository = HttpQRRepositoryMock();

    // The actual bloc to be tested
    qrFetchBloc = QRFetchBloc(
      repository: mockHttpRepository
    );
  });

  group("QRFetchBloc", () {
    test("The initial state must be 'QRLoading'", () {
      expect(qrFetchBloc.state, QRLoading());
    });

    blocTest<QRFetchBloc, QRFetchState>(
        "Testing how the bloc behaves when the seed is correctly fetched",
        build: () {
          final mockSeed = Seed.fromJson({
            "seed": "test",
            "expires_at": DateTime.now()
                .add(const Duration(seconds: 15))
                .toIso8601String(),
          });

          when(mockHttpRepository.getData(dio: anyNamed("dio")))
              .thenAnswer((_) async => mockSeed);

          return qrFetchBloc;
        },
        act: (bloc) => bloc.add(const FetchNewQR()),
        verify: (bloc) {
          expect(bloc.state, isA<QRLoaded>());
          expect((bloc.state as QRLoaded).timeLeft, greaterThan(0));
        });

    blocTest<QRFetchBloc, QRFetchState>(
        "Testing how the bloc behaves when the seed is not fetched",
        build: () {
          when(mockHttpRepository.getData(dio: anyNamed("dio")))
              .thenThrow(Exception());

          return qrFetchBloc;
        },
        act: (bloc) => bloc.add(const FetchNewQR()),
        expect: const [
          QRLoading(),
          QRError()
        ]);
  });
}