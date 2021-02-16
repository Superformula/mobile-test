import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qr_code/model/seed.dart';
import 'package:qr_code/redux/actions.dart';
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

  Widget _body() => StoreConnector<AppState, AppState>(
      onInit: (store) {
        store.dispatch(TurnOnAutoRefreshAction());
        store.dispatch(FetchSeedAction());
      },
      onDispose: (store) => store.dispatch(TurnOffAutoRefreshAction()),
      converter: (store) => store.state,
      builder: (context, state) {
        print('State is $state');
        if (state.isLoadingSeed) {
          return _loadingIndicator();
        }
        if (state.seed != null) {
          return _qrCode(state.seed);
        }
        return _errorMessage();
      });

  Widget _errorMessage() => Center(
        child: Column(
          children: [
            Text('Something wrong happened'),
            RaisedButton(child: Text('Try again'), onPressed: () => null),
          ],
        ),
      );

  Widget _loadingIndicator() => Center(child: CircularProgressIndicator());

  Widget _qrCode(Seed seed) => OrientationBuilder(builder: (context, orientation) {
        final qrImage = QrImage(data: seed.value);
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(36),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    orientation == Orientation.portrait ? qrImage : Expanded(child: qrImage),
                    Text('15 seconds'), // TODO - replace hard-coded text with count down timer
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
