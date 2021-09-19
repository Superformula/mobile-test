import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRView extends StatelessWidget {
  const QRView({
    required this.qrData,
    required this.secondsToExpire,
    Key? key,
  }) : super(key: key);

  final String qrData;
  final int secondsToExpire;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        QrImage(
          data: qrData,
          version: QrVersions.auto,
          size: 200,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          qrData,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(
          height: 32,
        ),
        Text(
          'Expires in ${secondsToExpire} second(s)...',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
