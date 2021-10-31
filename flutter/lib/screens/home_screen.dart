//Flutter Packages
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'package:superformula_scanner/screens/offline_screen.dart';
import 'package:superformula_scanner/screens/qr_code_screen.dart';
import 'package:superformula_scanner/screens/scanner_screen.dart';

//My Packages
import '../widgets/action_button.dart';
import '../widgets/expandable_fab.dart';

//Third party packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {

  static const routeName = "/home_screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //Offline handler
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

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      floatingActionButton: ExpandableFab(
        distance: ScreenUtil().setHeight(90),
        children: [
          ActionButton(
            onPressed: () => Navigator.of(context).pushNamed(QRCCodeScreen.routeName),
            icon: const Icon(Icons.qr_code),
          ),
          ActionButton(
            onPressed: () => Navigator.of(context).pushNamed(ScannerScreen.routeName),
            icon: const Icon(Icons.camera_alt),
          ),
        ],
      ),
      body: Lottie.asset('assets/animations/home.json',width: ScreenUtil().setHeight(600),height: ScreenUtil().setHeight(600)),
    );
  }
}
