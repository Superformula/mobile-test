import 'package:flutter_test/flutter_test.dart';
import 'package:superformula_test/view/blocs/qr_code_history_bloc/qr_code_history_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:superformula_test/view/models/qr_code_view_model.dart';

void main() {
  late final QRCodeHistoryCubit qrCodeHistoryCubit;

  setUp(
    () {
      qrCodeHistoryCubit = QRCodeHistoryCubit();
    },
  );

  group(
    'updateHistory [METHOD]',
    () {
      const model = QRCodeViewModel(seed: '');
      blocTest<QRCodeHistoryCubit, QRCodeHistoryState>(
        'should update the current list with the new model',
        build: () => qrCodeHistoryCubit,
        act: (bloc) {
          bloc.updateHistory(model);
        },
        expect: () => [
          const QRCodeHistoryState(qrCodeList: [model])
        ],
      );
    },
  );
}
