import 'dart:async';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class QrCodeScreen extends StatefulWidget {
  final String data;
  final String deviceId;
  final int time;
  const QrCodeScreen({Key? key, required this.data, required this.deviceId, required this.time}) : super(key: key);

  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCodeScreen> {
  int startTime = 0;
  final DateTime _now = DateTime.now();
  late Timer timer;
  // starts the timer when seed is generated and displayed
  void startTimer() {
    int convertedtime = (_now.millisecondsSinceEpoch / 1000).floor();
    int start = convertedtime == widget.time ? 15 : convertedtime - widget.time;
    startTime = start;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (startTime == 0) {
          setState(() {
            timer.cancel();                 
          });
        } else {
          setState(() {
            startTime--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QRcode'),
      backgroundColor: Colors.deepPurple[300],),
      body: Column(
        children: [
           SizedBox(
          height: MediaQuery.of(context).size.height * .10,
        ),
          Center(
            child: BarcodeWidget(
              barcode: Barcode.qrCode(
                errorCorrectLevel: BarcodeQRCorrectionLevel.high,
              ),
              data: widget.data,
              width: 200,
              height: 200,
            ),
          ),
        const SizedBox(height: 50,),
        startTime != 0 ?  Text(
            '$startTime',
            textAlign: TextAlign.end,
            style: const TextStyle(fontSize: 70.0, color: Color(0xff655cf3), fontWeight: FontWeight.w700),
          ) : const SizedBox(height: 1,),
        ],
      ),
    );
  }
}
