import 'package:flutter_test/flutter_test.dart';
import 'package:superformula_test/view/blocs/qr_code_history_bloc/qr_code_history_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:superformula_test/view/models/qr_code_seed_view_model.dart';

void main() {
  late final QrCodeHistoryCubit qrCodeHistoryCubit;

  setUp(
    () {
      qrCodeHistoryCubit = QrCodeHistoryCubit();
    },
  );

  group(
    'updateHistory [METHOD]',
    () {
      const model = QrCodeSeedViewModel(seed: '');
      blocTest<QrCodeHistoryCubit, QrCodeHistoryState>(
        'should update the current list with the new model',
        build: () => qrCodeHistoryCubit,
        act: (bloc) {
          bloc.updateHistory(model);
        },
        expect: () => [
          const QrCodeHistoryState(qrCodeList: [model])
        ],
      );
    },
  );
}
