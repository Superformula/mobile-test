import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:supercode/models.dart';
import 'package:supercode/redux/actions.dart';
import 'package:supercode/redux/app_state.dart';
import 'package:supercode/widgets/qr_code.dart';

class QRCodeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return QrCode(
          loading: vm.loading,
          seed: vm.activeSeed,
          timerDurationSeconds: vm.timerDurationSeconds,
          fetchQRCode: vm.fetchQRCode,
        );
      },
    );
  }
}

class _ViewModel {
  final bool loading;
  final Seed activeSeed;
  final int timerDurationSeconds;
  final Function({Function() onError}) fetchQRCode;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      activeSeed: store.state.activeSeed,
      loading: store.state.loading,
      timerDurationSeconds: store.state.timerDurationSeconds,
      fetchQRCode: ({onError}) {
        store.dispatch(
          FetchQRCode(onError: onError),
        );
      },
    );
  }

  _ViewModel({
    this.activeSeed,
    this.loading,
    this.timerDurationSeconds,
    this.fetchQRCode,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          activeSeed == other.activeSeed;

  @override
  int get hashCode => activeSeed.hashCode;
}
