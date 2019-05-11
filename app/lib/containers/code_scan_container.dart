import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:supercode/redux/actions.dart';
import 'package:supercode/redux/app_state.dart';
import 'package:supercode/widgets/code_scan.dart';

class CodeScanContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      onDispose: (store) {
        store.dispatch(ResetValidate());
      },
      builder: (context, vm) {
        return CodeScan(
          validating: vm.validating,
          codeIsValid: vm.codeIsValid,
          validateCode: vm.validateCode,
        );
      },
    );
  }
}

class _ViewModel {
  final bool codeIsValid;
  final bool validating;
  final Function(String code) validateCode;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      validating: store.state.validating,
      codeIsValid: store.state.codeIsValid,
      validateCode: (code) {
        store.dispatch(ValidateCode(code));
      },
    );
  }

  _ViewModel({
    this.validating,
    this.validateCode,
    this.codeIsValid,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          codeIsValid == other.codeIsValid &&
          validating == other.validating;

  @override
  int get hashCode => codeIsValid.hashCode ^ validating.hashCode;
}
