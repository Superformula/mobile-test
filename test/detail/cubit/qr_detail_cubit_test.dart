import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test/base/result_state.dart';
import 'package:mobile_test/detail/cubit/qr_detail_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_api/qr_api.dart';
import 'package:qr_models/qr_models.dart';

class MockRepository extends Mock implements SeedRepository {}

void main() {
  group('QrDetailCubit::', () {
    late SeedRepository repository;
    final qrSeed = QRSeed('seed', 'expiresAt');
    final exception = Exception('Error');

    setUp(() {
      repository = MockRepository();
    });

    test('initial state is Initial', () {
      expect(
        QrDetailCubit(repository).state,
        equals(const Initial<QRSeed>()),
      );
    });

    blocTest<QrDetailCubit, ResultState<QRSeed>>(
      'emits [ResultState.data] when getQrSeed is successful.',
      build: () => QrDetailCubit(repository),
      act: (bloc) {
        when(() => repository.fetchSeed()).thenAnswer(
          (_) async => ApiResult.success(qrSeed),
        );
        return bloc.getQrSeed();
      },
      expect: () => <ResultState<QRSeed>>[
        const ResultState.loading(),
        ResultState.data(qrSeed),
      ],
      verify: (_) {
        verify(() => repository.fetchSeed()).called(1);
      },
    );

    blocTest<QrDetailCubit, ResultState<QRSeed>>(
      'emits [ResultState.error] when getQrSeed is failure.',
      build: () => QrDetailCubit(repository),
      act: (bloc) {
        when(() => repository.fetchSeed()).thenAnswer(
          (_) async => ApiResult.failure(exception),
        );
        return bloc.getQrSeed();
      },
      expect: () => <ResultState<QRSeed>>[
        const ResultState.loading(),
        ResultState.error(exception.toString()),
      ],
      verify: (_) {
        verify(() => repository.fetchSeed()).called(1);
      },
    );
  });
}
