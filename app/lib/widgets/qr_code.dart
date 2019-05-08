import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:supercode/models.dart';

class QrCode extends StatefulWidget {
  final bool loading;
  final Seed seed;
  final Function() fetchQRCode;

  const QrCode({Key key, this.loading, this.seed, this.fetchQRCode})
      : super(key: key);

  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  Widget _buildQRCode() {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        child: QrImage(
          data: widget.seed.seed,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: widget.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _buildQRCode(),
    );
  }
}
