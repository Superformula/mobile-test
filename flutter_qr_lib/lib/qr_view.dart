import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'qr_controller.dart';

class QRView extends StatefulWidget {
  QRView({
    Key key,
    @required this.onControllerCreated,
  }) : super(key: key);

  final QRControllerCreated onControllerCreated;

  @override
  _QRViewState createState() => _QRViewState();
}

class _QRViewState extends State<QRView> {
  @override
  Widget build(BuildContext context) {
    const viewType = 'QR-View';

    if (Platform.isIOS)
      return UiKitView(
        viewType: viewType,
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    else if (Platform.isAndroid)
      return AndroidView(
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    else
      throw UnsupportedError("Unsupported platform ");
  }

  Future<void> onPlatformViewCreated(int id) async {
    if (widget.onControllerCreated == null) return;

    widget.onControllerCreated(QRController(id));
  }
}
