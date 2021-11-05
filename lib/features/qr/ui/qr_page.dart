import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sf_qr_code/features/qr/bloc/qr_bloc.dart';
import 'package:sf_qr_code/themes/app_colors.dart';

class QRPage extends StatefulWidget {
  @override
  _QRPageState createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  String displayTimer = "";
  num timerNum = 0;
  Timer? timer;
  int _start = 0; // default

  @override
  void initState() {
    BlocProvider.of<QrBloc>(context).add(QrSeedRequestEvent());
    setState(() {
      displayTimer = "";
      timerNum = 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QrBloc, QrState>(
        listener: _pageListener,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.yellowDark,
              centerTitle: true,
              title: Text("QR CODE", style: TextStyle(color: Colors.white)),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Wrap(
                      children: [
                        state.seedData != null && state.seedData?.seed != null
                            ? Center(
                                child: Column(
                                  children: [
                                    QrImage(
                                      data: state.seedData!.seed!,
                                      version: QrVersions.auto,
                                      size: 200.0,
                                    ),
                                    Text(state.seedData!.seed!)
                                  ],
                                ),
                              )
                            : SizedBox.shrink(),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Center(
                            child: Text(
                              displayTimer,
                              style: TextStyle(
                                  color:
                                      timerNum <= 5 ? Colors.red : Colors.blue,
                                  fontSize: 40),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _pageListener(BuildContext context, QrState state) async {
    // Listening the State when QRSeed request call successful
    if (state is QrSeedResponseSuccessfulState) {
      setState(() {
        String? expiryAtTime = state.seedData?.expiresAt;
        if (expiryAtTime != null) {
          // calculate the timer difference for the current time and the expirtAt
          _start =
              DateTime.parse(expiryAtTime).difference(DateTime.now()).inSeconds;
        }
      });
       startTimer();
    }
  }

  void startTimer() {
    //compute to display the timer in seconds
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          displayTimer = "";
          setState(() {
            timer.cancel();
          });
          _start = 0;
          BlocProvider.of<QrBloc>(context).add(QrSeedRequestEvent());
        } else {
          setState(() {
            _start--;
            timerNum = _start;
            displayTimer = _start.toString() + " s";
          });
        }
      },
    );
  }
}
