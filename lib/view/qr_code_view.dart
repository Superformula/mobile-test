import 'package:flutter/material.dart';
import 'package:qr_test/controller/api/networking.dart';
import 'package:qr_test/model/data_seed.dart';
import 'package:qr_test/view/components/qr_code_widget.dart';

class QRCodeView extends StatefulWidget {
  final bool isConnected;
  const QRCodeView({Key? key, required this.isConnected}) : super(key: key);

  @override
  _QRCodeViewState createState() => _QRCodeViewState();
}

class _QRCodeViewState extends State<QRCodeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
      ),
      body: Center(
        child: FutureBuilder<DataSeed?>(
          future: Networking().getSeed(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData && !snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [QRCodeWidget(data: snapshot.data.data)],
              );
            } else {
              return Text(snapshot.data.toString());
            }
          },
        ),
      ),
    );
  }
}
