import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qr_code/redux/app_state.dart';

class ValidationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(),
    );
  }

  Widget _body() => StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          if (state.isValidatingQrCode) {
            return _loadingIndicator();
          }
          if (state.validateCodeFailed) {
            return _errorMessage();
          }
          if (state.hasValidQrCode) {
            return _successMessage();
          }
          if (!state.hasValidQrCode) {
            return _expiredMessage();
          }
          return Container();
        },
      );

  Widget _loadingIndicator() => Center(child: CircularProgressIndicator());

  Widget _successMessage() => Center(child: Text("Good job! You've got a valid QR Code"));

  Widget _expiredMessage() => Center(child: Text('This QR Code has expired. Try a new one'));

  Widget _errorMessage() => Center(
        child: Column(
          children: [
            Text('Something wrong happened'),
            RaisedButton(child: Text('Try again'), onPressed: null),
          ],
        ),
      );
}
