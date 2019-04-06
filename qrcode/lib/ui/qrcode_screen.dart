import 'package:flutter/material.dart';
import 'package:qrcode/core/bloc.dart';
import 'package:qrcode/env/data_mgr.dart';
import 'package:qrcode/env/env.dart';
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
      body: StreamBuilder(
        stream: bloc.fetchSeed(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Center(
                child: getSeedDisplayWidget(snapshot.data)
            );
          } else {
            return Text("waiting");
          }
        },
      )
    );
  }
}

class QRCodeScreenBloc extends BlocBase {

  final _seedFetcher = PublishSubject<String>();
  Observable<String> get seeds => _seedFetcher.stream;

  QRCodeScreenBloc(Env env) : super(env);

  Observable<String> fetchSeed() {
    DataMgr dataMgr = getManager(Env.DATA_MGR_KEY);
    dataMgr.fetchSeed().then((seed) => _seedFetcher.sink.add(seed));
    return seeds;
  }

  @override
  void dispose() {
    _seedFetcher.close();
  }

}