import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_test/locator/service_locator.dart';
import 'package:flutter_mobile_test/pages/generator/generator_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneratorPage extends StatelessWidget {
  final GeneratorBloc _bloc = locator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: StreamBuilder(
            stream: _bloc.qrCodeSeedObservable,
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return QrImage(data: snapshot.data, size: 300);
              } else {
                return CircularProgressIndicator();
              }
            },
          )),
          Center(
              child: StreamBuilder(
            stream: _bloc.timerObservable,
            builder: (context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.toString());
              } else {
                return Container();
              }
            },
          ))
        ],
      ),
    );
  }
}
