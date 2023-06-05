part of 'scan_cubit.dart';

enum ScanStatus { initial, success, failure }

class ScanState extends Equatable {
  const ScanState({
    this.status = ScanStatus.initial,
    this.qrCode,
    this.isValid,
  });

  final ScanStatus status;
  final String? qrCode;
  final bool? isValid;

  ScanState copyWith({
    ScanStatus? status,
    String? qrCode,
    bool? isValid,
  }) {
    return ScanState(
      status: status ?? this.status,
      qrCode: qrCode ?? this.qrCode,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [status, qrCode, isValid];
}
