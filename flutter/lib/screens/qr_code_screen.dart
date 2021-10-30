//Flutter packages
import 'package:flutter/material.dart';
import 'dart:async';

//My Packages
import '../providers/superformula_provider.dart';

//Third party packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
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

    //Call the seed API
    var provider = Provider.of<SuperFormulaProvider>(context, listen: false);

    provider.getSeed(context: context);

    //Timer to update time
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (mounted) {
        setState(() {
          //Update the time
          time = 59 - DateTime
              .now()
              .toUtc()
              .second;

          //Update the text
          timeInString = (time).toString();

          //Update the QR Code every minute
          if (time == 0) {
            //Minor delay to avoid a bug of getting the same previous seed
            Future.delayed(const Duration( seconds: 1),(){
              provider.getSeed(context: context);
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    //Provider data
    var _provider = Provider.of<SuperFormulaProvider>(context);
    String _seed = _provider.seed;

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
                data: _seed,
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
