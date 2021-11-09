import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrapp/models/downloadstatus.dart';
import 'package:qrapp/services/qrservice.dart';

class QRGenPage extends StatefulWidget {
  const QRGenPage({Key? key}) : super(key: key);

  @override
  _QRGenPageState createState() => _QRGenPageState();
}

class _QRGenPageState extends State<QRGenPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    var provider = Provider.of<QRService>(context, listen: false);

    await provider.getSeed(context);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });

    setState(() {});
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  Widget buildQRCode(BuildContext context) {
    if (context.watch<QRService>().seedDownloadStatus == DownloadStatus.ERROR) {
      return const Text("Error Creating QR Code");
    }

    if (context.watch<QRService>().seed != null) {
      return QrImage(
        data: json.encode(context.watch<QRService>().seed!.toJson()).toString(),
        version: QrVersions.auto,
        size: 270,
        eyeStyle: const QrEyeStyle(
          eyeShape: QrEyeShape.square,
          color: Colors.black,
        ),
        dataModuleStyle: const QrDataModuleStyle(
            dataModuleShape: QrDataModuleShape.square, color: Colors.black),
        gapless: true,
      );
    }

    return const CircularProgressIndicator();
  }

  Widget buildTimerCountDown() {
    if (context.watch<QRService>().seed != null) {
      if (DateTime.now()
              .toUtc()
              .isBefore(context.watch<QRService>().seed!.expiresAt) ==
          true) {
        return Text(
          '${context.watch<QRService>().seed!.expiresAt.difference(DateTime.now().toUtc()).inSeconds}s..',
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        );
      } else {
        return const Text(
          "Expired!",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
        );
      }
    }

    return const Text(
      "Loading...",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildQRCode(context),
            const SizedBox(height: 10),
            buildTimerCountDown(),
          ],
        ),
      ),
    );
  }
}
