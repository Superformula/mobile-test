//Flutter Packages
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'dart:io';

//Third party packages
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'package:superformula_scanner/providers/superformula_provider.dart';

import 'offline_screen.dart';

class ScannerScreen extends StatefulWidget {

  static const routeName = "/scanner_screen";
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {

  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");

  late QRViewController controller;

  String _scannedSeed = "";

  StreamSubscription? subscription;

  @override
  void initState() {
    super.initState();
    SimpleConnectionChecker _simpleConnectionChecker = SimpleConnectionChecker()
      ..setLookUpAddress('pub.dev'); //Optional method to pass the lookup string
    subscription = _simpleConnectionChecker.onConnectionChange.listen((connected) {
      if(!connected){
        Navigator.of(context).pushNamedAndRemoveUntil(OfflineScreen.routeName, (route) => false);
      }
    });
  }

  //Dispose the Scanner controller
  @override
  void dispose() {
    subscription?.cancel();
    controller.dispose();
    super.dispose();
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanner"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(80)),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(
                width: ScreenUtil().setHeight(300),
                height: ScreenUtil().setHeight(300),
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Scanner Code
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {

      //Avoid verifying the code redundantly
      if(_scannedSeed!=scanData.code || _scannedSeed.isEmpty) {
        //Change the value of scanned seed
        _scannedSeed = scanData.code;
        //Verify the seed
        Provider.of<SuperFormulaProvider>(context, listen: false).verifySeed(
            seed: _scannedSeed, context: context);
      }
    });
  }
}
