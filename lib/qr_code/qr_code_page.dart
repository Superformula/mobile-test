import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qr_code/model/seed.dart';
import 'package:qr_code/redux/app_state.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: _body(),
    );
  }

  Widget _body() => StoreConnector<AppState, Seed>(
      converter: (store) => store.state.seed,
      builder: (context, seed) {
        if (seed == null) {
          return _errorMessage();
        }
        return QrImage(data: seed.value);
      });

  Widget _errorMessage() => Center(child: Text('Something wrong happened'));
}
