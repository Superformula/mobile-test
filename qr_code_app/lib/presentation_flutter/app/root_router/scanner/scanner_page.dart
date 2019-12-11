import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_code_app/presentation_flutter/app/intl/app_localizations.dart';

class ScannerPage extends StatelessWidget {
  final Function onBack;

  const ScannerPage({
    Key key,
    @required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).scanner),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: onBack,
        ),
      ),
      body: Container(),
    );
  }
}