import 'package:flutter/material.dart';
import '../../generated/l10n.dart';
import 'components/home_actions_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).homePageTitle),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: const HomeActionsButton(),
    );
  }
}
