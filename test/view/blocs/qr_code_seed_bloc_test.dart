import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:superformula_test/core/resources/result.dart';
import 'package:superformula_test/data/errors/failure.dart';
import 'package:superformula_test/domain/entities/qr_code_seed_entity.dart';
import 'package:superformula_test/domain/use_cases/qr_code_get_seed_use_case.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:superformula_test/view/blocs/qr_code_seed_bloc/qr_code_seed_bloc.dart';
import 'package:superformula_test/view/models/qr_code_seed_view_model.dart';

class QrCodeGetSeedUseCaseMock extends Mock implements QrCodeGetSeedUseCase {}

void main() {
  late QrCodeSeedCubit qrCodeSeedCubit;
  late final QrCodeGetSeedUseCase qrCodeGetSeedUseCase;

  setUpAll(() {
    qrCodeGetSeedUseCase = QrCodeGetSeedUseCaseMock();
  });

  setUp(
    () {
      qrCodeSeedCubit = QrCodeSeedCubit(qrCodeGetSeedUseCase);
    },
  );

  group(
    'getSeed [METHOD]',
    () {
      final entity = QrCodeSeedEntity(seed: '');
      final viewModel = QrCodeSeedViewModel(seed: entity.seed);

      blocTest<QrCodeSeedCubit, QrCodeSeedState>(
        'should emit [QrCodeSeedSuccessState]',
        build: () => qrCodeSeedCubit,
        setUp: () {
          when(() => qrCodeGetSeedUseCase()).thenAnswer(
            (_) async => Result.success(entity),
          );
        },
        act: (bloc) {
          bloc.getSeed();
        },
        expect: () => [
          const QrCodeSeedLoadingState(),
          QrCodeSeedSuccessState(viewModel),
        ],
      );

      blocTest<QrCodeSeedCubit, QrCodeSeedState>(
        'should emit [QrCodeSeedFailedState]',
        build: () => qrCodeSeedCubit,
        setUp: () {
          when(() => qrCodeGetSeedUseCase()).thenAnswer(
            (_) async => Result.failure(RepositoryFailure('')),
          );
        },
        act: (bloc) {
          bloc.getSeed();
        },
        expect: () => [
          const QrCodeSeedLoadingState(),
          const QrCodeSeedFailedState(''),
        ],
      );
    },
  );
}
