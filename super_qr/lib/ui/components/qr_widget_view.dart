import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:super_qr/models/seed.dart';

class QRImageView extends StatelessWidget {
  final Seed seed;

  const QRImageView({Key key, this.seed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: seed.seed,
      size: 200.0,
    );
  }
}
