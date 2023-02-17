import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:superformula_test/core/resources/result.dart';
import 'package:superformula_test/data/errors/failure.dart';
import 'package:superformula_test/domain/entities/qr_code_entity.dart';
import 'package:superformula_test/domain/use_cases/qr_code_get_seed_use_case.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:superformula_test/view/blocs/qr_code_bloc/qr_code_bloc.dart';
import 'package:superformula_test/view/models/qr_code_view_model.dart';

class QRCodeGetSeedUseCaseMock extends Mock implements QRCodeGetSeedUseCase {}

void main() {
  late QRCodeCubit qrCodeCubit;
  late final QRCodeGetSeedUseCase qrCodeGetSeedUseCase;

  setUpAll(() {
    qrCodeGetSeedUseCase = QRCodeGetSeedUseCaseMock();
  });

  setUp(
    () {
      qrCodeCubit = QRCodeCubit(qrCodeGetSeedUseCase);
    },
  );

  group(
    'getSeed [METHOD]',
    () {
      const entity = QRCodeEntity(seed: '');
      final viewModel = QRCodeViewModel(seed: entity.seed);

      blocTest<QRCodeCubit, QRCodeState>(
        'should emit [QRCodeSuccessState]',
        build: () => qrCodeCubit,
        setUp: () {
          when(() => qrCodeGetSeedUseCase()).thenAnswer(
            (_) async => const Result.success(entity),
          );
        },
        act: (bloc) {
          bloc.getSeed();
        },
        expect: () => [
          const QRCodeLoadingState(),
          QRCodeSuccessState(viewModel),
        ],
      );

      blocTest<QRCodeCubit, QRCodeState>(
        'should emit [QRCodeFailedState]',
        build: () => qrCodeCubit,
        setUp: () {
          when(() => qrCodeGetSeedUseCase()).thenAnswer(
            (_) async => const Result.failure(RepositoryFailure('')),
          );
        },
        act: (bloc) {
          bloc.getSeed();
        },
        expect: () => [
          const QRCodeLoadingState(),
          const QRCodeFailedState(''),
        ],
      );
    },
  );
}
