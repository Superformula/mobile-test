import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'package:superformula_scanner/screens/home_screen.dart';
import 'package:superformula_scanner/values.dart' as values;

class OfflineScreen extends StatefulWidget {

  static const routeName = "/offline_screen";

  const OfflineScreen({Key? key}) : super(key: key);

  @override
  _OfflineScreenState createState() => _OfflineScreenState();
}

class _OfflineScreenState extends State<OfflineScreen> {

  String _seed = "";

  //Offline handler
  StreamSubscription? subscription;

  @override
  void initState() {
    super.initState();

    SimpleConnectionChecker _simpleConnectionChecker = SimpleConnectionChecker()
      ..setLookUpAddress('pub.dev'); //Optional method to pass the lookup string
    subscription = _simpleConnectionChecker.onConnectionChange.listen((connected) {
      if(connected){
        Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
      }
    });

    getOfflineSeed();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  void getOfflineSeed() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _seed = prefs.getString(values.SEED_KEY)??"";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Offline"),
      ),
      body: Center(
        child:  _seed.isNotEmpty?QrImage(
          data: _seed,
          version: QrVersions.auto,
          size: ScreenUtil().setHeight(300),
        ):Lottie.asset('assets/animations/no_internet.json',width: ScreenUtil().setHeight(600),height: ScreenUtil().setHeight(600)),
      ),
    );
  }
}
