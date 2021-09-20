import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:superformula_mobile_test/application/display_qr_code/display_qr_code_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QrCodeErrorWidget extends StatelessWidget {
  const QrCodeErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const size = 150.0;
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPaint(
            size: const Size.square(size),
            painter: QrPainter(
              data: '',
              version: QrVersions.min,
              eyeStyle: const QrEyeStyle(
                eyeShape: QrEyeShape.square,
                color: Color(0xFFDFDFDF),
              ),
              dataModuleStyle: const QrDataModuleStyle(
                dataModuleShape: QrDataModuleShape.square,
                color: Color(0xFFDFDFDF),
              ),
            ),
          ),
          const RefreshQrCodeButton()
        ],
      ),
    );
  }
}

class RefreshQrCodeButton extends StatelessWidget {
  const RefreshQrCodeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context
            .read<DisplayQrCodeBloc>()
            .add(const DisplayQrCodeEvent.requestedNewQrCode());
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
      ),
      child: const Icon(
        Icons.refresh,
        size: 50,
      ),
    );
  }
}
