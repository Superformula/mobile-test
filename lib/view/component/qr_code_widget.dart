import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeWidget extends StatelessWidget {
  final String data;
  final double? size;

  const QRCodeWidget({required this.data, this.size = 400, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QrImage(
      //String data to be displayed as a QRCode
      data: data,
      size: size,
    );
  }
}
