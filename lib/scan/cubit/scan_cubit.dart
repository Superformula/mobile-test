import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_code_repository/qr_code_repository.dart';

part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit({
    required QrCodeRepository qrCodeRepository,
  })  : _qrCodeRepository = qrCodeRepository,
        super(const ScanState());

  final QrCodeRepository _qrCodeRepository;

  Future<void> validateQrCode({
    required String qrCode,
  }) async {
    try {
      final validQrCode = await _qrCodeRepository.validateQrCode();

      emit(
        state.copyWith(
          status: ScanStatus.success,
          isValid: validQrCode,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: ScanStatus.failure,
        ),
      );
    }
  }
}
