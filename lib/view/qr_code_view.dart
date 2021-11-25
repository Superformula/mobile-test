import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:qr_test/controller/api/networking.dart';

import 'package:http/http.dart' show Client;
import 'package:qr_test/controller/services/local_cache.dart';
import 'package:qr_test/model/constants.dart';
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
  final box = Hive.box<DataSeed>(boxName);
  @override
  void initState() {
    super.initState();

    Duration oneSecond = const Duration(seconds: 1);

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      timer = Timer.periodic(oneSecond, (Timer t) {
        if (context.read<TimerProvider>().timeLeft == 0) {
          setState(() {});
        } else {
          context.read<TimerProvider>().decrementTimer();
        }
      });
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
          //if connected to the network or internet then show futurebuilder anda attempt to get a data seed
          child: widget.isConnected
              ? FutureBuilder<DataSeed?>(
                  future: NetworkingImpl(client: Client()).getSeed(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    //countDownTimer();
                    if (snapshot.hasData && !snapshot.hasError) {
                      LocalCacheImpl(box: box).cacheLastDataSeed(snapshot.data);
                      // HiveServices.addSeedToBox(snapshot.data, boxName);
                      //Updates timer provider startTime with the time to DataSeed's expiration in seconds
                      context.read<TimerProvider>().getTimeToExpire(
                          snapshot.data.expiresAt, DateTime.now());

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          QRCodeWidget(data: snapshot.data.data),
                          Consumer<TimerProvider>(
                              builder: (context, value, child) {
                            return Text("Expires in ${value.timeLeft} seconds");
                          }),
                        ],
                      );
                    } else if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    } else {
                      //Updates timer provider startTime with the time in seconds till reattempting to get a seed
                      context.read<TimerProvider>().updateStartTime(60);
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LocalCacheImpl(box: box).isCacheEmpty == true
                              ? const Text('No cached data')
                              : QRCodeWidget(
                                  data: LocalCacheImpl(box: box)
                                      .getLastDataSeed()
                                      .data),
                          Consumer<TimerProvider>(
                              builder: (context, value, child) {
                            return Text(
                                "Will retry in ${value.timeLeft} seconds");
                          }),
                        ],
                      );
                    }
                  },
                )
              : const Text('Please check your internet connection')),
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
