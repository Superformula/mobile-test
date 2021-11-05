import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sf_qr_code/home/dashboard_page.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 2000),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DashboardPage())));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.all(0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Color(0xFF4174FE),
                radius: 100,
                child: Icon(Icons.qr_code_scanner_outlined,
                    color: Colors.white, size: 100),
              ),
              SizedBox(height: 30),
              Text("QR Code!",
                  style: TextStyle(
                    fontSize: 40,
                    color: Color(0xFF4174FE),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
