import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:superformula_qr_code/models/seed_model.dart';
import 'package:superformula_qr_code/services/api_service.dart';
import 'package:superformula_qr_code/shared/app_routes.dart';
import 'package:http/http.dart' as http;

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  // To avoid unecessary rebuilds, initialize api call & countdown stream outside of the build widget
  final Future<SeedModel> _future = ApiService().getSeed(http.Client());

  static const int _count = 15;
  final Stream<int> _countdown = countdown(_count);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
        centerTitle: true,
      ),
      body: StreamBuilder<dynamic>(
          stream: _countdown,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              // if our connection state (countdown stream) is active and has data we display the qr code and the countdown timer
              case ConnectionState.active:
                if (snapshot.hasData) {
                  var count = snapshot.data;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FutureBuilder<SeedModel>(
                        future: _future,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.hasData) {
                            var seed = snapshot.data!.seed;
                            return Center(
                              child: QrImage(
                                data: seed,
                                size: 250,
                              ),
                            );
                          }
                          return const Center(
                            child: Text('Something went wrong'),
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      Text('$count s'),
                    ],
                  );
                }
                break;
              // if our connectionstate (countdown stream) is done we display text and the refresh button
              case ConnectionState.done:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text('Times up!'),
                    ),
                    const SizedBox(height: 5),
                    TextButton(
                      onPressed: () {
                        // refreshes by replacing the current route to reinitialize the getSeed call and stream countdown
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.qrCodeScreen);
                      },
                      child: const Text('Get a new code'),
                    ),
                  ],
                );
              default:
            }
            return Container();
          }),
    );
  }
}

// countdown starts from count param (ie 15), and ends after 16 1 second intervals(ie 0)
Stream<int> countdown(int count) =>
    Stream.periodic(const Duration(seconds: 1), (e) => count - e).take(16);
