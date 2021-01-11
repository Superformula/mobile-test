import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/images.dart';
import 'package:flutter_app/screens/scan_qr_code/scan_qr_code_view_model.dart';
import 'package:flutter_app/extensions/string_extension.dart';

class ScanQRCodeScreen extends StatefulWidget {

  final ScanQRCodeViewModel viewModel;
  ScanQRCodeScreen({ @required this.viewModel });

  @override
  _ScanQRCodeScreenState createState() => _ScanQRCodeScreenState();

  factory ScanQRCodeScreen.create() {
    var viewModel =  ScanQRCodeViewModel();
    return ScanQRCodeScreen(viewModel: viewModel);
  }
}

class _ScanQRCodeScreenState extends State<ScanQRCodeScreen>
    with ScanQRCodeDelegate {

  ScanQRCodeViewModel _viewModel;
  String _result;

  @override
  void initState() {
    super.initState();
    _viewModel = widget.viewModel;
    _viewModel.setDelegate(this);
  }

  @override
  onFailure(String errorMessage) {
    print(errorMessage);
  }

  @override
  onSuccess(String data) {
    setState(() {
      if(data != '-1') {
        _result = data;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          textTheme: theme.textTheme,
          iconTheme: theme.iconTheme,
          title: Text('scan_screen_title'.localize(context))
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Image.asset(Images.scan, width: 128, height: 128),
                ),
                Container(height: 24),
                _result != null
                    ? Text(_result ?? '')
                    : Text('scan_screen_message'.localize(context)),
                Container(height: 24),
                ElevatedButton(
                  onPressed: () {
                    _viewModel.scan();
                  },
                  child: Text('scan_screen_scan'.localize(context))),
                TextButton(
                  child: Text('scan_screen_clear'.localize(context)),
                  onPressed: () {
                    setState(() {
                      _result = null;
                    });
                  })
              ])
          ),
        )
    );
  }

}