import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/services.dart';
import 'package:generator/widgets/appbar.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  void initState() {
    super.initState();
    _scan();
  }

  String qrCodeResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context, label: "SCAN"),
      body: SafeArea(child: scanWidget()),
    );
  }

  Widget scanWidget() => Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.qr_code,
                  size: 50,
                  semanticLabel: "Scanner",
                ),
                onPressed: () {
                  _scan();
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .10,
              ),
              Text(
                  (qrCodeResult == "")
                      ? "PLEASE SCAN AGAIN"
                      : "Result:" + qrCodeResult,
                  style: Theme.of(context).textTheme.bodyText1),
            ]),
      );

  Future<void> _scan() async {
    try {
      ScanResult codeScanner = await BarcodeScanner.scan();
      setState(() {
        qrCodeResult = codeScanner.rawContent;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          qrCodeResult = "Camera Permission Denied";
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
