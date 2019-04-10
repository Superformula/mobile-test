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
class QRCodeScreen extends StatefulWidget {
  static const ERROR_MSG_FAILED_SEED_FETCH = "Error Fetching Seed!";

  SeedWidgetBuilder getSeedDisplayWidgetBuilder() => QrImageWigetBuilder();

  @override
  _QRCodeScreenState createState() => _QRCodeScreenState(getSeedDisplayWidgetBuilder());
}

abstract class SeedWidgetBuilder {
  Widget buildWidget(BuildContext context, String seed);
}

class QrImageWigetBuilder extends SeedWidgetBuilder {
  @override
  Widget buildWidget(BuildContext context, String seed) {
    return QrImage(
      data: seed,
      size: 200.0,
    );
  }
}

class _QRCodeScreenState extends State<QRCodeScreen> {


  QRCodeScreenBloc bloc;
  SeedWidgetBuilder _displayWidget;

  _QRCodeScreenState(this._displayWidget);

  @override
  dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<QRCodeScreenBloc>(context);
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
                        child: _displayWidget.buildWidget(context, snapshot.data.seed)
                    );
                  } else {
                    return Center(
                        child: Text(QRCodeScreen.ERROR_MSG_FAILED_SEED_FETCH)
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
                  return Text("", style: TextStyle(fontSize: 28));
                }
              },
            ),

          ],
        )
    );
  }
}

///
/// Bloc to control business logic of screen.  Supplies a stream to supply an updated seed and
/// amount of time left in seconds till the seed expires.
///
class QRCodeScreenBloc extends BlocBase {

  final _seedFetcher = PublishSubject<Seed>();
  Observable<Seed> get seeds => _seedFetcher.stream;

  final _expiresAtTimer = PublishSubject<int>();
  Observable<int> get expiresAt => _expiresAtTimer.stream;

  Timer _timer;
  int _start = 0;

  QRCodeScreenBloc(Env env) : super(env);

  _fetchSeed() {
    DataMgr dataMgr = getManager(Env.MGR_KEY_DATA);
    dataMgr.fetchSeed().then((seed) {
      _seedFetcher.sink.add(seed);
      if (seed.success) {
        print("now ${DateTime
            .now()
            .millisecondsSinceEpoch
            .toString()}");
        _start = ((seed.expiresAt - DateTime
            .now()
            .millisecondsSinceEpoch) / 1000).toInt();
        startTimer();
      }
    });
  }

  Observable<Seed> fetchSeed() {
    _fetchSeed();
    return seeds;
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
        oneSec,
            (Timer timer) {
              if (_start < 1) {
                // once the time gets to zero, restart
                timer.cancel();
                _fetchSeed();
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
    _timer?.cancel();
    _seedFetcher?.close();
  }
}