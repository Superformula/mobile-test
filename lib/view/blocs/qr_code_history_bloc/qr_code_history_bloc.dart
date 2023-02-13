import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superformula_test/view/models/qr_code_view_model.dart';

part 'qr_code_history_state.dart';

class QRCodeHistoryCubit extends Cubit<QRCodeHistoryState> {
  QRCodeHistoryCubit() : super(QRCodeHistoryState.initial());

  void updateHistory(QRCodeViewModel newModel) {
    final newList = List<QRCodeViewModel>.from(state.qrCodeList);
    emit(state.copyWith(qrCodeList: newList..add(newModel)));
  }
}
