import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_test/controller/api/networking.dart';
import 'package:qr_test/model/data_seed.dart';
import 'package:qr_test/view/components/qr_code_widget.dart';
import 'package:qr_test/model/timer_provider.dart';
import 'package:provider/provider.dart';

class QRCodeView extends StatefulWidget {
  final bool isConnected;
  const QRCodeView({Key? key, required this.isConnected}) : super(key: key);

  @override
  _QRCodeViewState createState() => _QRCodeViewState();
}

class _QRCodeViewState extends State<QRCodeView> {
  late Timer timer;
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
      ),
      body: Center(
        child: FutureBuilder<DataSeed?>(
          future: Networking().getSeed(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData && !snapshot.hasError) {
              context
                  .read<TimerProvider>()
                  .getTimeToExpire(snapshot.data.expiresAt, DateTime.now());
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QRCodeWidget(data: snapshot.data.data),
                  Consumer<TimerProvider>(builder: (context, value, child) {
                    return Text("Expires in ${value.timeLeft} seconds");
                  }),
                ],
              );
            } else {
              return Text(snapshot.data.toString());
            }
          },
        ),
      ),
    );
  }
}
