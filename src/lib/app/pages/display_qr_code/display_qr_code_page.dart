import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:qrcodevalidator/app/pages/display_qr_code/display_qr_code_controller.dart';
import 'package:qrcodevalidator/app/widgets/countdown.dart';
import 'package:qrcodevalidator/data/repositories/data_qr_code_repository.dart';

class DisplayQRCodePage extends View {
  @override
  State<StatefulWidget> createState() => DisplayQRCodeState();
}

class DisplayQRCodeState
    extends ViewState<DisplayQRCodePage, DisplayGetQRCodeController> {
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
                ControlledWidgetBuilder<DisplayGetQRCodeController>(
                    builder: (context, controller) {
                  return Text(controller.qrCode?.seed?.toString() ?? 'NOPE');
                }),
                ControlledWidgetBuilder<DisplayGetQRCodeController>(
                    builder: (context, controller) {
                  return Countdown(remainingTime: controller.remainingTime);
                }),
              ],
            );
          }),
        ),
      );
}
