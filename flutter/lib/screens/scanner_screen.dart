//Flutter Packages
import 'dart:async';
import 'dart:io';
//Third party packages
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
//My Packages
import '../providers/superformula_provider.dart';
import '../screens/offline_screen.dart';

class ScannerScreen extends StatefulWidget {

  static const routeName = "/scanner_screen";
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {

  //Object declarations

  final GlobalKey _qrKey = GlobalKey(debugLabel: "QR");

  late QRViewController _controller;

  String _scannedSeed = "";

  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    //Offline stream
    SimpleConnectionChecker _simpleConnectionChecker = SimpleConnectionChecker()
      ..setLookUpAddress('pub.dev'); //Optional method to pass the lookup string
    _subscription =
        _simpleConnectionChecker.onConnectionChange.listen((connected) {
          if (!connected) {
            //Launch offline screen when the device is offline
            Navigator.of(context).pushNamedAndRemoveUntil(
                OfflineScreen.routeName, (route) => false);
          }
        });
  }

  //Dispose the Scanner controller
  @override
  void dispose() {
    _subscription?.cancel();
    _controller.dispose();
    super.dispose();
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _controller.pauseCamera();
    } else if (Platform.isIOS) {
      _controller.resumeCamera();
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Dialog(
            child: Container(
              width: ScreenUtil().setWidth(400),
              height: ScreenUtil().setHeight(400),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ScreenUtil().setHeight(30)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animations/success.json', repeat: false,
                      width: ScreenUtil().setHeight(300),
                      height: ScreenUtil().setHeight(300)),
                  SizedBox(height: ScreenUtil().setHeight(24),),
                  const Text("Seed is valid", style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),)
                ],
              ),
            ),
          ),
        );
      },
    ).then((value) => _scannedSeed = "");
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Dialog(
            child: Container(
              width: ScreenUtil().setWidth(400),
              height: ScreenUtil().setHeight(400),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ScreenUtil().setHeight(30)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animations/error.json', repeat: false,
                      width: ScreenUtil().setHeight(300),
                      height: ScreenUtil().setHeight(300)),
                  SizedBox(height: ScreenUtil().setHeight(24),),
                  const Text("Invalid seed", style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),)
                ],
              ),
            ),
          ),
        );
      },
    ).then((value) => _scannedSeed = "");
  }

  //Scanner Code
  void _onQRViewCreated(QRViewController controller) {
    this._controller = controller;
    controller.scannedDataStream.listen((scanData) {
      //Avoid verifying the code redundantly
      if (_scannedSeed != scanData.code || _scannedSeed.isEmpty) {
        //Change the value of scanned seed
        _scannedSeed = scanData.code;
        //Verify the seed
        Provider.of<SuperFormulaProvider>(context, listen: false).verifySeed(
          seed: _scannedSeed,
          context: context,
          showValidDialog: _showSuccessDialog,
          showInvalidDialog: _showErrorDialog,
        );
      }
    });
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
                  key: _qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
