import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superformula_scanner/values.dart' as values;

class OfflineScreen extends StatefulWidget {

  static const routeName = "/offline_screen";

  const OfflineScreen({Key? key}) : super(key: key);

  @override
  _OfflineScreenState createState() => _OfflineScreenState();
}

class _OfflineScreenState extends State<OfflineScreen> {

  String _seed = "";


  @override
  void initState() {
    super.initState();
    getOfflineSeed();
  }

  void getOfflineSeed() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _seed = prefs.getString(values.SEED_KEY)??"";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child:  Visibility(
          visible: _seed.isNotEmpty,
          child: QrImage(
            data: _seed,
            version: QrVersions.auto,
            size: ScreenUtil().setHeight(300),
          ),
        ),
      ),
    );
  }
}
