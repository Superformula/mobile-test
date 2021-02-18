import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qr_code/redux/actions.dart';
import 'package:qr_code/redux/app_state.dart';
import 'package:qr_code/utils/failure_widget.dart';
import 'package:qr_code/utils/info_widget.dart';
import 'package:redux/redux.dart';

class ValidationDialog extends StatelessWidget {
  const ValidationDialog(this._codeToValidate);

  final String _codeToValidate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(),
    );
  }

  Widget _body() => StoreConnector<AppState, _ViewModel>(
        onInit: (store) => store.dispatch(ValidateQrCodeAction(_codeToValidate)),
        converter: (store) => _ViewModel.from(store, _codeToValidate),
        builder: (context, vm) {
          return vm.validationState.when(
            idle: () => Container(),
            inProgress: _loadingIndicator,
            validCode: _successMessage,
            expiredCode: _expiredMessage,
            error: () => FailureWidget(tapButtonCallback: vm.onRetryValidation),
          );
        },
      );

  Widget _loadingIndicator() => Center(child: CircularProgressIndicator());

  Widget _successMessage() => const InfoWidget(
        imagePath: 'assets/img/success.svg',
        message: "Good job! You've got a valid QR Code",
      );

  Widget _expiredMessage() => const InfoWidget(
        imagePath: 'assets/img/expired.svg',
        message: 'This QR Code has expired. Try a new one',
      );
}

class _ViewModel {
  _ViewModel(this.validationState, {@required this.onRetryValidation});

  final ValidationState validationState;
  final Function() onRetryValidation;

  static _ViewModel from(Store<AppState> store, String codeToValidate) => _ViewModel(
        store.state.validationState,
        onRetryValidation: () => store.dispatch(ValidateQrCodeAction(codeToValidate)),
      );
}
