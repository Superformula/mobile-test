import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qr_code/home/home_page.dart';
import 'package:qr_code/redux/app_state.dart';
import 'package:redux/redux.dart';

class QrCodeApp extends StatelessWidget {
  const QrCodeApp(this._store);

  final Store<AppState> _store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _store,
      child: MaterialApp(
        title: 'QR Code',
        theme: ThemeData.dark(),
        home: HomePage(),
      ),
    );
  }
}
