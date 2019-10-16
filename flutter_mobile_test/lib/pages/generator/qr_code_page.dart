import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_test/locator/service_locator.dart';
import 'package:flutter_mobile_test/pages/generator/qr_code_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodePage extends StatelessWidget {
  final QrCodeBloc _bloc = locator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: _bloc.qrCodeSeedObservable,
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return QrImage(data: snapshot.data, size: 300);
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('Error getting QR code ${snapshot.error}'));
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
          Center(
              child: StreamBuilder(
            stream: _bloc.timerObservable,
            builder: (context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasData) {
                final counter = snapshot.data;
                if (counter > 0) {
                  return Text(counter.toString());
                } else {
                  return Text('This QR code has expired');
                }
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