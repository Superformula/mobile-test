import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCCodeScreen extends StatefulWidget {

  static const routeName = "/qr_code_screen";
  const QRCCodeScreen({Key? key}) : super(key: key);

  @override
  _QRCCodeScreenState createState() => _QRCCodeScreenState();
}

class _QRCCodeScreenState extends State<QRCCodeScreen> {

  late Timer timer;
  int time = 0;
  String timeInString = "X";

  @override
  void initState() {
    super.initState();

    //Timer to update time
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => setState(() {

      //Update the time
      time = 59-DateTime.now().toUtc().second;

      //Update the text
      timeInString=(time).toString();

      //Update the QR Code every minute
      if(time==0){
        //Update QR Code
      }

    }));
  }


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
              Visibility(
                visible: timeInString!="X",
                child: Text(
                  timeInString+"s",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: time>9?Colors.black87:Colors.red
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
