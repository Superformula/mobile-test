import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_code_app/presentation_flutter/app/intl/app_localizations.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).title),
      ),
    );
  }
}
