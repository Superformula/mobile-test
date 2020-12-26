import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_test_app/cubit/qr_cubit.dart';
import 'package:mobile_test_app/widgets/expiration_countdown.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'QR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrCubit, QrState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              children: [
                if (state is QrGenerated)
                  QrImage(
                    data: state.qrCode.code,
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                if (state is QrGenerated) ExpirationCountdown(expiresAt: state.qrCode.expiresAt,)
              ],
            ),
          ),
        );
      },
    );
  }
}

