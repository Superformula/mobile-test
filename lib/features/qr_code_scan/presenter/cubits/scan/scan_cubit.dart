import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:superformula_leandro/core/constants/strings_constants.dart';

part 'scan_state.dart';

final class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(const ScanInitialState());

  void onPermissionSet(QRViewController _, bool isPermissionGranted) {
    if (isPermissionGranted) return;
    emit(
      const ScanErrorState(errorMessage: StringsConstants.permissionNotGranted),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((Barcode scanData) {
      final String? data = scanData.code;
      if (data == null) return;
      emit(ScannedDataState(data: data));
    });
  }

  void startScan() {
    emit(const ScanningState());
  }
}
