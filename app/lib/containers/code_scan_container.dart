import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:supercode/redux/app_state.dart';
import 'package:supercode/widgets/code_scan.dart';

class CodeScanContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return CodeScan();
      },
    );
  }
}

class _ViewModel {
  final Function(String code) validateCode;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel();
  }

  _ViewModel({this.validateCode});
}
