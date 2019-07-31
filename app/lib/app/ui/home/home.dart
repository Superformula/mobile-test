import 'package:flutter/material.dart';
import 'package:qrgenerator/app/intl/app_strings.dart';
import 'package:qrgenerator/app/ui/home/multi_fab.dart';
import 'package:qrgenerator/app/ui/scan/scan.dart';
import 'package:qrgenerator/app/ui/widgets/pages.dart';

Widget buildHomePage() {
  return HomePage();
}

class HomePage extends StatefulPage {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends PageState<HomePage> {
  String _scanResult;

  @override
  void initState() {
    super.initState();
    _scanResult = "";
  }

  @override
  Widget buildAppBar(BuildContext context) {
    final strings = AppStrings.of(context);
    return AppBar(
      title: Text(strings.homeTitle),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    final strings = AppStrings.of(context);
    final theme = Theme.of(context).textTheme;
    final String label = _scanResult.isEmpty ? strings.scanResultEmpty : strings.scanResult;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(label, style: theme.display1),
          Text(_scanResult, style: theme.display1),
        ],
      ),
    );
  }

  Widget buildFab(BuildContext context) {
    return MultiFab(
      onScan: () => _onScan(context),
      onGenerate: () => _onGenerate(context),
    );
  }

  void _onScan(BuildContext context) async {
    final strings = AppStrings.of(context);
    try {
      String scanResult = await scanQRCode(context);
      if (scanResult.isNotEmpty) {
        setState(() {
          _scanResult = scanResult;
        });
      }
    } catch (error) {
      showSnackBar(strings.scanError);
    }
  }

  void _onGenerate(BuildContext context) {
    Navigator.pushNamed(context, '/generate');
  }
}
