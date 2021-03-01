import 'package:flutter/material.dart';

import 'package:qr_code_gen/qr_code_gen.dart' show QrPainter;

///
/// * [QRCode]
///
class QRCode extends StatelessWidget {
  /// Displays the QR code contained in a [QrPainter].
  const QRCode({Key key, @required this.qrPainter}) : super(key: key);

  /// Painter that contains the visuals for the QR code.
  final QrPainter qrPainter;

  @override
  Widget build(BuildContext context) {
    final sideLength = MediaQuery.of(context).size.width * .9;

    return SizedBox(
      height: sideLength,
      width: sideLength,
      child: Align(
        child: CustomPaint(
          painter: qrPainter,
          size: Size.square(sideLength),
        ),
      ),
    );
  }
}
