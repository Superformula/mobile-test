import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:superformula_scanner/screens/home_screen.dart';
import 'package:superformula_scanner/screens/scanner_screen.dart';
import 'package:superformula_scanner/widgets/action_button.dart';
import 'package:superformula_scanner/widgets/expandable_fab.dart';

class QRCCodeScreen extends StatefulWidget {

  static const routeName = "/qr_code_screen";
  const QRCCodeScreen({Key? key}) : super(key: key);

  @override
  _QRCCodeScreenState createState() => _QRCCodeScreenState();
}

class _QRCCodeScreenState extends State<QRCCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(80)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              QrImage(
                data: "1234567890",
                version: QrVersions.auto,
                size: ScreenUtil().setHeight(300),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(48),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
