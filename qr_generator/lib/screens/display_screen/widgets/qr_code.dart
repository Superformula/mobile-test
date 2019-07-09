import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator/models/seed.dart';

class QrCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var seed = Provider.of<Seed>(context);
    return QrImage(
      data: seed.seed,
      size: 200.0,
      foregroundColor: Colors.grey[900],
    );
  }
}
