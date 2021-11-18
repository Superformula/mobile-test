import 'dart:async';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qr_code_test/controller/api/get_seed.dart';

import 'package:qr_code_test/controller/services/hive_services.dart';
import 'package:qr_code_test/model/seed_model.dart';

import 'package:qr_code_test/model/time_provider.dart';
import 'package:qr_code_test/view/component/qr_code_widget.dart';

class QRCodeViewer extends StatefulWidget {
  final bool connection;
  const QRCodeViewer({required this.connection, Key? key}) : super(key: key);

  @override
  _QRCodeViewerState createState() => _QRCodeViewerState();
}

class _QRCodeViewerState extends State<QRCodeViewer> {
  //Pulls seed from Hive database
  final box = HiveServices.getSeedFromMemory("seed");

  late Timer timer;
//Initializes view with a new timer and time to expiration for current active seed.
//Decrements the the startTime in Time Provider by 1 until countdown hits 0 then requests another seed using refresh seed function
  @override
  void initState() {
    super.initState();

    Duration oneSecond = const Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (Timer t) {
      if (context.read<TimerProvider>().timeLeft == 0) {
        setState(() {});
      } else {
        context.read<TimerProvider>().decrementTimer();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
      ),
      body: Center(
          child: widget.connection == true || box.isNotEmpty == true
              ? FutureBuilder<Seed?>(
                  future: Networking().getSeed(context, box),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData && !snapshot.hasError) {
                      return QrDisplayWidget(
                        snapshot: snapshot.data.seed,
                        message: "Expires in",
                      );
                    } else {
                      context.read<TimerProvider>().updateStartTime(60);
                      return QrDisplayWidget(
                          snapshot: box.getAt(0)!.seed,
                          message: "Error, retrying in:");
                    }
                  },
                )
              : const Text(
                  'No QR code cached and can\'t retreive from network')),
    );
  }
}

class QrDisplayWidget extends StatelessWidget {
  var snapshot;
  final String message;
  QrDisplayWidget({
    required this.snapshot,
    required this.message,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        QRCodeWidget(
            data: snapshot, size: MediaQuery.of(context).size.width * .6),
        Consumer<TimerProvider>(builder: (context, value, child) {
          return Text("$message ${value.timeLeft} seconds");
        }),
      ],
    );
  }
}
