import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:qr_app/data/constants/app_data.dart';
import 'package:qr_app/data/services/qr_service.dart';

class ScannerResult extends StatefulWidget {
  final String scanResult;

  const ScannerResult({Key key, this.scanResult}) : super(key: key);
  @override
  _ScannerResultState createState() => _ScannerResultState();
}

class _ScannerResultState extends State<ScannerResult> {
  Future<String> _qrModelValidateFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _qrModelValidateFuture =
        QrService().validateQrData(IOClient(), widget.scanResult);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _qrModelValidateFuture,
        builder: (context, AsyncSnapshot<dynamic> asyncsnapshot) {
          if (asyncsnapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!asyncsnapshot.hasData && !asyncsnapshot.hasError) {
            return Container();
          }
          if (asyncsnapshot.hasError) {
            return Container(
              child: Center(
                child: Text(asyncsnapshot.error.toString()),
              ),
            );
          }
          final String result = asyncsnapshot.data;
          String text;
          switch (result) {
            case AppData.valid:
              {
                break;
              }
            case AppData.invalid:
              {
                text = 'Invalid Code';
                break;
              }
            case AppData.expired:
              {
                text = 'Expired Code';
                break;
              }
          }
          return Container(
            child: (text == null)
                ? CircleAvatar(child: Icon(Icons.check))
                : Text(text),
          );
        });
  }
}
