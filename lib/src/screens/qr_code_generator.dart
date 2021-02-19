import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_test/src/bloc/qr_code_generator_bloc.dart';
import 'package:mobile_test/src/customWidgets/custom_countdown_timer.dart';
import 'package:mobile_test/src/screens/base_screen.dart';
import 'package:mobile_test/src/services/seed_respository.dart';
import 'package:mobile_test/src/styles/custom_styles.dart';
import 'package:mobile_test/src/utilities/size_config.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRCodeScreen extends StatefulWidget {
  const GenerateQRCodeScreen({this.qrCodeBloc});
  final QRCodeGeneratorBloc qrCodeBloc;
  @override
  GenerateQRCodeScreenState createState() =>
      GenerateQRCodeScreenState(qrCodeBloc: qrCodeBloc);
}

class GenerateQRCodeScreenState extends State<GenerateQRCodeScreen> {
  GenerateQRCodeScreenState({this.qrCodeBloc});
  QRCodeGeneratorBloc qrCodeBloc;
  Widget getWidget = const CircularProgressIndicator();
  Timer timer;

  @override
  void initState() {
    super.initState();
    qrCodeBloc ??= QRCodeGeneratorBloc(repository: SeedRepository());
    timer = Timer.periodic(const Duration(seconds: 20), (Timer timer) {
      if (mounted) {
        setState(() {
          getWidget = Text(
            'Loading data has issues please try again later',
            style: CustomStyles.defaultStyle.copyWith(color: Colors.black),
          );
        });
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    qrCodeBloc.getGenerateQRCode();
    return BaseScreenScaffold(
      title: 'QRCODE',
      body: SingleChildScrollView(
          child: Center(
              heightFactor: 1.5,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    StreamBuilder<QrImage>(
                        initialData: qrCodeBloc.qrCodeSeed$.value,
                        stream: qrCodeBloc.qrCodeSeed$,
                        builder: (BuildContext context,
                            AsyncSnapshot<QrImage> snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data;
                          } else if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          }
                          return Container(key: const Key('no-qrLoaded'));
                        }),
                    StreamBuilder<String>(
                        initialData: qrCodeBloc.qrCodeExpiresAt$.value,
                        stream: qrCodeBloc.qrCodeExpiresAt$,
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          if (snapshot.hasData) {
                            final DateTime date = DateTime.parse(snapshot.data);
                            final int time = date
                                .difference(qrCodeBloc.getCurrentDateTime)
                                .inSeconds;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            getBlockSizeHorizontal(context) * 2,
                                        bottom:
                                            getBlockSizeHorizontal(context) *
                                                2),
                                    child: Text(
                                      'Expires At: ${date.toIso8601String()}',
                                      style: CustomStyles.defaultStyle,
                                    )),
                                CustomCountDownTimer(time),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          }

                          return Padding(
                              padding: EdgeInsets.only(
                                  top: getBlockSizeHorizontal(context) * 55),
                              child: getWidget);
                        }),
                  ]))),
    );
  }

  @override
  void dispose() {
    qrCodeBloc.dispose();
    timer.cancel();
    super.dispose();
  }
}
