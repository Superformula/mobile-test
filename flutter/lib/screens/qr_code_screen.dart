//Flutter packages
import 'package:flutter/material.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'dart:async';

//My Packages
import '../providers/superformula_provider.dart';

//Third party packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ntp/ntp.dart';

import 'offline_screen.dart';

class QRCCodeScreen extends StatefulWidget {

  static const routeName = "/qr_code_screen";
  const QRCCodeScreen({Key? key}) : super(key: key);

  @override
  _QRCCodeScreenState createState() => _QRCCodeScreenState();
}

class _QRCCodeScreenState extends State<QRCCodeScreen> {

  late Timer timer;
  int time = 0;
  String timeInString = "";

  //Offline handler
  StreamSubscription? subscription;

  @override
  void initState() {
    super.initState();

    //Offline stream
    SimpleConnectionChecker _simpleConnectionChecker = SimpleConnectionChecker()
      ..setLookUpAddress('pub.dev'); //Optional method to pass the lookup string
    subscription = _simpleConnectionChecker.onConnectionChange.listen((connected) {
      if(!connected){
        Navigator.of(context).pushNamedAndRemoveUntil(OfflineScreen.routeName, (route) => false);
      }
    });

    //Call the seed API
    var provider = Provider.of<SuperFormulaProvider>(context, listen: false);

    provider.getSeed(firstTime: true,context: context);

    //Timer to update time
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) async{

      //Get NTP time
      DateTime mySystemTime = DateTime.now().toUtc();
      int offset = await NTP.getNtpOffset(localTime: mySystemTime);
      DateTime actualTime = mySystemTime.add(Duration(milliseconds: offset));

      //Update the QR Code every minute
      if (actualTime.second==0) {
        if(mounted) provider.getSeed(firstTime: false,context: context);
      }

      //Update the timer text
      if (mounted) {
        setState((){
          //Update the time
          time = 59 - actualTime.second;

          //Update the text
          timeInString = (time).toString();
        });
      }
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    timer.cancel();
    super.dispose();
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
              Visibility(
                visible: _seed.isNotEmpty && timeInString.isNotEmpty,
                child: QrImage(
                  data: _seed,
                  version: QrVersions.auto,
                  size: ScreenUtil().setHeight(300),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(48),
              ),
              Visibility(
                visible: _seed.isNotEmpty && timeInString.isNotEmpty,
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
