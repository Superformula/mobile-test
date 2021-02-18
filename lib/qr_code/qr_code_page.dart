import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qr_code/model/seed.dart';
import 'package:qr_code/qr_code/countdown_widget.dart';
import 'package:qr_code/redux/actions.dart';
import 'package:qr_code/redux/app_state.dart';
import 'package:qr_code/utils/failure_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:redux/redux.dart';

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

  Widget _body() => StoreConnector<AppState, _ViewModel>(
      onInit: (store) {
        store.dispatch(TurnOnAutoRefreshAction());
        store.dispatch(FetchSeedAction());
      },
      onDispose: (store) => store.dispatch(TurnOffAutoRefreshAction()),
      converter: (store) => _ViewModel.from(store),
      builder: (context, vm) {
        return vm.seedState.when(
          idle: () => Container(),
          inProgress: _loadingIndicator,
          loaded: _qrCode,
          error: () => FailureWidget(tapButtonCallback: vm.onRetry),
        );
      });

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
                    SizedBox(height: 16),
                    CountdownWidget(endTime: seed.expiresAt.millisecondsSinceEpoch),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

class _ViewModel {
  _ViewModel(this.seedState, {@required this.onRetry});

  final SeedState seedState;
  final Function() onRetry;

  static _ViewModel from(Store<AppState> store) => _ViewModel(
        store.state.seedState,
        onRetry: () => store.dispatch(FetchSeedAction()),
      );
}
