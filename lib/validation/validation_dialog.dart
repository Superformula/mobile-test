import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qr_code/redux/actions.dart';
import 'package:qr_code/redux/app_state.dart';
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
          if (vm.state.isValidatingQrCode) {
            return _loadingIndicator();
          }
          if (vm.state.validateCodeFailed) {
            return _errorMessage(vm);
          }
          if (vm.state.hasValidQrCode != null) {
            if (vm.state.hasValidQrCode) {
              return _successMessage();
            }
            if (!vm.state.hasValidQrCode) {
              return _expiredMessage();
            }
          }
          return Container();
        },
      );

  Widget _loadingIndicator() => Center(child: CircularProgressIndicator());

  Widget _successMessage() => Center(child: Text("Good job! You've got a valid QR Code"));

  Widget _expiredMessage() => Center(child: Text('This QR Code has expired. Try a new one'));

  Widget _errorMessage(_ViewModel vm) => Center(
        child: Column(
          children: [
            Text('Something wrong happened'),
            RaisedButton(child: Text('Try again'), onPressed: vm.onRetryValidation),
          ],
        ),
      );
}

class _ViewModel {
  _ViewModel(this.state, {@required this.onRetryValidation});

  final AppState state;
  final Function() onRetryValidation;

  static _ViewModel from(Store<AppState> store, String codeToValidate) => _ViewModel(
        store.state,
        onRetryValidation: () => store.dispatch(ValidateQrCodeAction(codeToValidate)),
      );
}
