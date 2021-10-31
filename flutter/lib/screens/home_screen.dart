//Flutter Packages
import 'dart:async';
import 'package:flutter/material.dart';
//Third party packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
//My Packages
import '../screens/offline_screen.dart';
import '../screens/qr_code_screen.dart';
import '../screens/scanner_screen.dart';
import '../widgets/google_fab/action_button.dart';
import '../widgets/google_fab/expandable_fab.dart';

class HomeScreen extends StatefulWidget {

  static const routeName = "/home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //Object declarations

  //Offline stream handler
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();

    //Simple connection checker object init
    SimpleConnectionChecker _simpleConnectionChecker = SimpleConnectionChecker()
      ..setLookUpAddress('pub.dev'); //Optional method to pass the lookup string
    _subscription = _simpleConnectionChecker.onConnectionChange.listen((connected) {
      if(!connected){
        //Launch offline screen when the device is offline
        Navigator.of(context).pushNamedAndRemoveUntil(OfflineScreen.routeName, (route) => false);
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
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
