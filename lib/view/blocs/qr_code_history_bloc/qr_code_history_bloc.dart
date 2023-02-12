import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superformula_test/view/models/qr_code_seed_view_model.dart';

part 'qr_code_history_state.dart';

class QrCodeHistoryCubit extends Cubit<QrCodeHistoryState> {
  QrCodeHistoryCubit() : super(QrCodeHistoryState.initial());

  void updateHistory(QrCodeSeedViewModel newModel) {
    emit(state.copyWith(qrCodeList: state.qrCodeList..add(newModel)));
  }
}
