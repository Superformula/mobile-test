import 'package:flutter/material.dart';
import 'package:qrgenerator/app/intl/app_strings.dart';
import 'package:qrgenerator/app/ui/home/multi_fab.dart';
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(strings.noCode),
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

  void _onScan(BuildContext context) {}

  void _onGenerate(BuildContext context) {
    Navigator.pushNamed(context, '/generate');
  }
}
