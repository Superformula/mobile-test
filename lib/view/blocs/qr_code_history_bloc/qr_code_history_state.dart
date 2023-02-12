part of 'qr_code_history_bloc.dart';

class QrCodeHistoryState {
  List<QrCodeSeedViewModel> qrCodeList;

  QrCodeHistoryState({
    required this.qrCodeList,
  });

  factory QrCodeHistoryState.initial() => QrCodeHistoryState(
        qrCodeList: [],
      );

  QrCodeHistoryState copyWith({
    List<QrCodeSeedViewModel>? qrCodeList,
  }) {
    return QrCodeHistoryState(
      qrCodeList: qrCodeList ?? this.qrCodeList,
    );
  }
}
