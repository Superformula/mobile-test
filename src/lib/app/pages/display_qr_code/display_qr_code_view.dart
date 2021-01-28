import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcodevalidator/app/pages/display_qr_code/display_qr_code_controller.dart';
import 'package:qrcodevalidator/app/widgets/countdown.dart';
import 'package:qrcodevalidator/data/repositories/data_qr_code_repository.dart';

class DisplayQRCodeView extends View {
  @override
  State<StatefulWidget> createState() => DisplayQRCodeState();
}

class DisplayQRCodeState
    extends ViewState<DisplayQRCodeView, DisplayGetQRCodeController> {
  DisplayQRCodeState()
      : super(DisplayGetQRCodeController(DataQRCodeRepository()));

  @override
  Widget get view => Scaffold(
        appBar: AppBar(
          title: Text('QR CODE'),
          centerTitle: true,
        ),
        body: Center(
          key: globalKey,
          child: ControlledWidgetBuilder<DisplayGetQRCodeController>(
              builder: (context, controller) {
            if (controller.isLoading == true) {
              return CircularProgressIndicator();
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.qrCode == null)
                  GestureDetector(
                    onTap: controller.getQRCode,
                    child: Column(
                      children: [
                        Text(
                          'QR Code not found\ntap to try again',
                          textAlign: TextAlign.center,
                        ),
                        Container(height: 10),
                        Icon(Icons.refresh, size: 50),
                      ],
                    ),
                  ),
                if (controller.qrCode != null)
                  QrImage(
                    data: controller.qrCodeContent,
                    version: QrVersions.auto,
                    size: MediaQuery.of(context).size.width * 0.8,
                  ),
                if (controller.remainingTime != null)
                  Countdown(remainingTime: controller.remainingTime)
              ],
            );
          }),
        ),
      );
}
