import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qrcode/core/bloc.dart';
import 'package:qrcode/env/data_mgr.dart';
import 'package:qrcode/env/env.dart';
import 'package:qrcode/model/model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:qr_flutter/qr_flutter.dart';

///
/// Screen used to display QRCode from external seed
///
class QRCodeScreen extends StatelessWidget {

  Widget getSeedDisplayWidget(String seed) {
    return QrImage(
      data: seed,
      size: 200.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final QRCodeScreenBloc bloc = BlocProvider.of<QRCodeScreenBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text("QRCode"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder(
            stream: bloc.fetchSeed(),
            builder: (context, AsyncSnapshot<Seed> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.success) {
                  return Center(
                      child: getSeedDisplayWidget(snapshot.data.seed)
                  );
                } else {
                  return Center(
                      child: Text("Error Fetching Seed!")
                  );
                }
              } else {
                return Center(
                    child: Text("Fetching Seed")
                );
              }
            },
          ),
          SizedBox(height: 25),
          StreamBuilder(
            stream: bloc.fetchTimer(),
            builder: (context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.toString(), style: TextStyle(fontSize: 28));
              } else {
                return Container();
              }
            },
          ),

        ],
      )
    );
  }
}

class QRCodeScreenBloc extends BlocBase {

  final _seedFetcher = PublishSubject<Seed>();
  Observable<Seed> get seeds => _seedFetcher.stream;

  final _expiresAtTimer = PublishSubject<int>();
  Observable<int> get expiresAt => _expiresAtTimer.stream;

  Timer _timer;
  int _start = 10;

  QRCodeScreenBloc(Env env) : super(env);

  Observable<Seed> fetchSeed() {
    DataMgr dataMgr = getManager(Env.MGR_KEY_DATA);
    dataMgr.fetchSeed().then((seed) {
      _seedFetcher.sink.add(seed);
      startTimer();
    });

    return seeds;
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
        oneSec,
            (Timer timer) {
              if (_start < 1) {
                timer.cancel();
              } else {
                _start = _start - 1;
                _expiresAtTimer.sink.add(_start);
              }
            });
  }


  Observable<int> fetchTimer() {
    return expiresAt;
  }

  @override
  void dispose() {
    _timer.cancel();
    _seedFetcher.close();
  }

}

class TimerWidget extends StatefulWidget {
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer _timer;
  int _start = 10;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
        oneSec,
            (Timer timer) => setState(() {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        }));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Text("$_start");
  }
}
