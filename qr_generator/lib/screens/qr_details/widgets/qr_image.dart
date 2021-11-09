import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrImageWidget extends StatelessWidget {
  final String seedData;
  const QrImageWidget({Key? key, required this.seedData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: QrImage(
        data: seedData,
        version: QrVersions.auto,
        size: MediaQuery.of(context).size.width / 1.2,
        gapless: false,
      ),
    );
  }
}
