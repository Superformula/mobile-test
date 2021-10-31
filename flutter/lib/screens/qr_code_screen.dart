//Flutter packages
import 'dart:async';
import 'package:flutter/material.dart';
//Third party packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
//My Packages
import '../providers/superformula_provider.dart';
import 'offline_screen.dart';

class QRCCodeScreen extends StatefulWidget {

  static const routeName = "/qr_code_screen";
  const QRCCodeScreen({Key? key}) : super(key: key);

  @override
  _QRCCodeScreenState createState() => _QRCCodeScreenState();
}

class _QRCCodeScreenState extends State<QRCCodeScreen> {

  //Object declarations

  late Timer _timer;
  int _time = 0;
  String _timeInString = "";

  //Offline handler
  StreamSubscription? _offlineStreamSubscription;

  @override
  void initState() {
    super.initState();

    //Simple connection checker object init
    SimpleConnectionChecker _simpleConnectionChecker = SimpleConnectionChecker()
      ..setLookUpAddress('pub.dev'); //Optional method to pass the lookup string
    _offlineStreamSubscription = _simpleConnectionChecker.onConnectionChange.listen((connected) {
      if(!connected){
        //Launch offline screen when the device is offline
        Navigator.of(context).pushNamedAndRemoveUntil(OfflineScreen.routeName, (route) => false);
      }
    });

    //Call the seed API
    var provider = Provider.of<SuperFormulaProvider>(context, listen: false);

    provider.getSeed(firstTime: true,context: context);

    //Timer to update time
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) async{

      //Get NTP time
      DateTime mySystemTime = DateTime.now().toUtc();

      //Update the Seed[QR Code] every minute
      if (mySystemTime.second==0) {
        if(mounted) provider.getSeed(firstTime: false,context: context);
      }

      //Update the timer text
      if (mounted) {
        setState((){
          //Update the time,Show time in decreasing order
          _time = 59 - mySystemTime.second;

          //Update the text
          _timeInString = (_time).toString();
        });
      }
    });
  }

  @override
  void dispose() {
    _offlineStreamSubscription?.cancel();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //Objects

    var _provider = Provider.of<SuperFormulaProvider>(context);
    String _seed = _provider.seed;

    DOWNLOAD_STATE _downloadState = _provider.qrCodeDownloadingState;

    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: _downloadState==DOWNLOAD_STATE.DOWNLOADING?
           Center(
             child: Lottie.asset('assets/animations/circle.json',width: ScreenUtil().setHeight(600),height: ScreenUtil().setHeight(600)),
           ) :Padding(
          padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(80)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: _seed.isNotEmpty && _timeInString.isNotEmpty,
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
                visible: _seed.isNotEmpty && _timeInString.isNotEmpty,
                child: Text(
                  _timeInString+"s",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: _time>9?Colors.black87:Colors.red
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
