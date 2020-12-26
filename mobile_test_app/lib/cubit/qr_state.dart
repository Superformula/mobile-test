part of 'qr_cubit.dart';

@immutable
abstract class QrState {}

class QrInitial extends QrState {}

class QrLoading extends QrState {}
class QrGenerated extends QrState {
  final QrCode qrCode;

  QrGenerated(this.qrCode);
}
