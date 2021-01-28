import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcodevalidator/app/pages/scan_qr_code/scan_qr_code_controller.dart';
import 'package:qrcodevalidator/data/repositories/data_qr_code_repository.dart';
import 'package:qrcodevalidator/data/repositories/data_time_repository.dart';

class ScanQRCodeView extends View {
  final DataQRCodeRepository qrCodeRepository = DataQRCodeRepository();
  final DataTimeRepository timeRepository = DataTimeRepository();

  @override
  State<StatefulWidget> createState() => ScanQRCodeState(
        qrCodeRepository,
        timeRepository,
      );
}

class ScanQRCodeState extends ViewState<ScanQRCodeView, ScanQRCodeController> {
  ScanQRCodeState(
    DataQRCodeRepository qrCodeRepository,
    DataTimeRepository timeRepository,
  ) : super(ScanQRCodeController(qrCodeRepository, timeRepository));
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Widget _buildQrView() {
    final size = MediaQuery.of(context).size;

    // Check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = size.width < 400 || size.height < 400 ? 150.0 : 300.0;

    return ControlledWidgetBuilder<ScanQRCodeController>(
        builder: (context, controller) {
      return QRView(
        key: qrKey,
        cameraFacing: CameraFacing.front,
        onQRViewCreated: controller.initQrViewController,
        formatsAllowed: [BarcodeFormat.qrcode],
        overlay: QrScannerOverlayShape(
          borderColor: Colors.purple[300],
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea,
        ),
      );
    });
  }

  @override
  get view => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          key: globalKey,
          title: const Text('SCAN'),
          centerTitle: true,
        ),
        body: ControlledWidgetBuilder<ScanQRCodeController>(
          builder: (context, controller) {
            if (controller.isLoading == true)
              return const Center(
                child: const CircularProgressIndicator(),
              );

            if (controller.qrViewController != null &&
                controller.qrViewController.hasPermissions == false) {
              return const Center(
                child: const Text(
                  'We need permission to use\nyour camera',
                  textAlign: TextAlign.center,
                ),
              );
            }

            return Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  right: 0,
                  bottom: 170,
                  left: 0,
                  child: _buildQrView(),
                ),
                if (controller.qrViewController != null)
                  Positioned(
                    bottom: 50,
                    left: 0,
                    right: 0,
                    height: 70,
                    child: FloatingActionButton(
                      heroTag: 'flashlight',
                      elevation: 0,
                      child: FutureBuilder<bool>(
                        future: controller.qrViewController.getFlashStatus(),
                        builder: (_, snapshot) {
                          return Icon(
                            snapshot.connectionState != ConnectionState.done ||
                                    snapshot.data == false
                                ? Icons.flash_on
                                : Icons.flash_off,
                            size: 35,
                          );
                        },
                      ),
                      onPressed: controller.toggleFlash,
                    ),
                  ),
                AnimatedPositioned(
                  top: controller.showValidation == true ? 0 : -100,
                  left: 0,
                  right: 0,
                  height: 100,
                  duration: controller.validationAnimationDuration,
                  child: Container(
                    alignment: Alignment.center,
                    color: controller.currentValidation == true
                        ? Colors.green
                        : Colors.red,
                    child: Text(
                      'This QR code is ' +
                          (controller.currentValidation == true
                              ? 'valid'
                              : 'invalid'),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      );
}
