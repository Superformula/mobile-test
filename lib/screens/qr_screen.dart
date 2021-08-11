import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrdemo/providers/qr_provider.dart';
import 'package:qrdemo/providers/timer_provider.dart';
import 'package:qrdemo/screens/home_screen.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({Key? key}) : super(key: key);

  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  @override
  Widget build(BuildContext context) {
    return Selector<QRProvider, String>(
        selector: (_, provider) => provider.code!,
        builder: (context, code, _) {
          return QRImageView(data: code);
        });
  }
}

class QRImageView extends StatefulWidget {
  const QRImageView({Key? key, this.data}) : super(key: key);

  final String? data;

  @override
  _QRImageViewState createState() => _QRImageViewState();
}

class _QRImageViewState extends State<QRImageView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: Provider.of<TimerProvider>(context, listen: false).startClock(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Scaffold(
              body: Container(
                child: Center(child: CircularProgressIndicator()),
              ),
            );
          case ConnectionState.done:
            if (Platform.isIOS) {
              return _buildIOSScreen();
            } else {
              return _buildAndroidScreen();
            }
        }
      },
    );
  }

  Future<bool> onWillPop() async {
    await Navigator.pushAndRemoveUntil(
        context,
        Platform.isIOS
            ? CupertinoPageRoute(builder: (context) => HomeScreen())
            : MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
    return Future.value(true);
  }

  Widget _buildIOSScreen() {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Selector<TimerProvider, bool>(
                selector: (_, provider) => provider.expired!,
                builder: (context, expired, child) {
                  return Text(
                    expired ? 'Expired code' : widget.data!,
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              Selector<TimerProvider, bool>(
                selector: (_, provider) => provider.expired!,
                builder: (context, expired, child) {
                  return QrImage(data: expired ? '' : widget.data!, size: 300);
                },
              ),
              SizedBox(
                height: 30,
              ),
              Consumer(
                builder: (BuildContext context, TimerProvider provider, _) {
                  if (provider.expired!) {
                    return IconButton(
                        onPressed: () async {
                          provider.reset();
                          provider.expire();
                          Provider.of<QRProvider>(context, listen: false)
                              .generateCode();
                        },
                        icon: Icon(Icons.refresh));
                  } else if (provider.countdown! > 1 || !provider.expired!) {
                    return Text('Expires in ${provider.countdown}');
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAndroidScreen() {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Selector<TimerProvider, bool>(
                selector: (_, provider) => provider.expired!,
                builder: (context, expired, child) {
                  return Text(
                    expired ? 'Expired code' : widget.data!,
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              Selector<TimerProvider, bool>(
                selector: (_, provider) => provider.expired!,
                builder: (context, expired, child) {
                  return QrImage(data: expired ? '' : widget.data!, size: 300);
                },
              ),
              SizedBox(
                height: 30,
              ),
              Consumer(
                builder: (BuildContext context, TimerProvider provider, _) {
                  if (provider.expired!) {
                    return IconButton(
                        onPressed: () async {
                          provider.reset();
                          provider.expire();
                          Provider.of<QRProvider>(context, listen: false)
                              .generateCode();
                          //await provider.startClock();
                        },
                        icon: Icon(Icons.refresh));
                  } else if (provider.countdown! > 1 || !provider.expired!) {
                    return Text('Expires in ${provider.countdown}');
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
