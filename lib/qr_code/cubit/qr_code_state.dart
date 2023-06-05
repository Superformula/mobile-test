part of 'qr_code_cubit.dart';

enum QrCodeStatus { initial, success, failure }

class QrCodeState extends Equatable {
  const QrCodeState({
    this.status = QrCodeStatus.initial,
    this.qrCode,
    this.duration,
  });

  final QrCodeStatus status;
  final int? duration;
  final QrCode? qrCode;

  QrCodeState copyWith({
    QrCodeStatus? status,
    QrCode? qrCode,
    int? duration,
  }) {
    return QrCodeState(
      status: status ?? this.status,
      qrCode: qrCode ?? this.qrCode,
      duration: duration ?? this.duration,
    );
  }

  @override
  List<Object?> get props => [status, qrCode, duration];
}
