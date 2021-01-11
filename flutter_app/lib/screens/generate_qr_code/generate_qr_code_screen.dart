import 'package:flutter/material.dart';
import 'package:flutter_app/core/images.dart';
import 'package:flutter_app/models/qr_code_data.dart';
import 'package:flutter_app/services/networking.dart';
import 'generate_qr_code_view_model.dart';
import 'package:flutter_app/extensions/string_extension.dart';

class GenerateQRCodeScreen extends StatefulWidget {

  final GenerateQRCodeViewModel viewModel;
  GenerateQRCodeScreen({ @required this.viewModel });

  @override
  _GenerateQRCodeScreenState createState() => _GenerateQRCodeScreenState();

  factory GenerateQRCodeScreen.create() {
    var service = NetworkingService();
    var viewModel =  GenerateQRCodeViewModel(service: service);
    return GenerateQRCodeScreen(viewModel: viewModel);
  }
}

class _GenerateQRCodeScreenState extends State<GenerateQRCodeScreen>
    with GenerateQRCodeDelegate {

  final imageSize = 200.0;
  final _key = GlobalKey<FormState>();

  GenerateQRCodeViewModel _viewModel;
  TextEditingController _controller;
  QRCodeData _data;
  bool _isLoading;

  @override
  void initState() {
    super.initState();

    _isLoading = false;

    _viewModel = widget.viewModel;
    _viewModel.setDelegate(this);

    _controller = TextEditingController();
  }

  void _fetchQRCode(String text) {
    setState(() {
      _isLoading = true;
      _viewModel.fetchQRCode(text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  onFailure(String errorMessage) {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  onSuccess(QRCodeData data) {
    setState(() {
      _data = data;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        textTheme: theme.textTheme,
        iconTheme: theme.iconTheme,
        title: Text('generate_screen_title'.localize(context))
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: imageSize,
                    width: imageSize,
                    child: _isLoading
                        ? Padding(
                            padding: const EdgeInsets.all(56.0),
                            child: CircularProgressIndicator())
                        : Container(
                            child: _data != null
                              ? Image.memory(_data.seed, height: imageSize, width: imageSize)
                              : Container(
                                  padding: EdgeInsets.all(48.0),
                                  child: Image.asset(Images.qrCode)))),
                  Text('generate_screen_message'.localize(context)),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _controller,
                    decoration: InputDecoration(
                        labelText: 'generate_screen_text'.localize(context)),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'generate_screen_required'.localize(context);
                      }
                      return null;
                    }
                  ),
                  Container(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      if(_key.currentState.validate()) {
                        _fetchQRCode(_controller.text);
                      }
                    },
                    child: Text('generate_screen_generate'.localize(context))),
                  TextButton(
                    child: Text('generate_screen_clear'.localize(context)),
                    onPressed: () {
                      setState(() {
                        _data = null;
                        _controller.clear();
                      });
                    })
                ],
              )
            ),
          ),
        ),
      )
    );
  }
}