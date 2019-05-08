import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:supercode/home.dart';
import 'package:supercode/models.dart';
import 'package:supercode/redux/actions.dart';
import 'package:supercode/redux/app_state.dart';

class ActiveQRSeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return Home(
          activeSeed: vm.activeSeed,
          loading: vm.loading,
          fetchQRCode: vm.fetchQRCode,
        );
      },
    );
  }
}

class _ViewModel {
  final bool loading;
  final Seed activeSeed;
  final Function() fetchQRCode;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        activeSeed: store.state.activeSeed,
        loading: store.state.loading,
        fetchQRCode: () {
          store.dispatch(
            FetchQRSeed(),
          );
        });
  }

  _ViewModel({
    this.activeSeed,
    this.loading,
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
