part of 'qr_code_history_bloc.dart';

class QrCodeHistoryState extends Equatable {
  final List<QrCodeSeedViewModel> qrCodeList;

  const QrCodeHistoryState({
    required this.qrCodeList,
  });

  factory QrCodeHistoryState.initial() => const QrCodeHistoryState(
        qrCodeList: [],
      );

  QrCodeHistoryState copyWith({
    List<QrCodeSeedViewModel>? qrCodeList,
  }) {
    return QrCodeHistoryState(
      qrCodeList: qrCodeList ?? this.qrCodeList,
    );
  }

  @override
  List<Object?> get props => qrCodeList;
}
