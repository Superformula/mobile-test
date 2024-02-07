import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'scan_state.dart';

final class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(const ScanInitialState());

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
