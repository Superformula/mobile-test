part of 'qr_code_history_bloc.dart';

class QRCodeHistoryState extends Equatable {
  final List<QRCodeViewModel> qrCodeList;

  const QRCodeHistoryState({
    required this.qrCodeList,
  });

  factory QRCodeHistoryState.initial() => const QRCodeHistoryState(
        qrCodeList: [],
      );

  QRCodeHistoryState copyWith({
    List<QRCodeViewModel>? qrCodeList,
  }) {
    return QRCodeHistoryState(
      qrCodeList: qrCodeList ?? this.qrCodeList,
    );
  }

  @override
  List<Object?> get props => qrCodeList;
}
