import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/blocs/seed_bloc.dart';

import 'widgets/menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<SeedBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      floatingActionButton: Menu(onPress: (name) {
        if (name == MenuName.QRCode)
          bloc.navToQRCode();
        else
          bloc.navToScan();
      }),
    );
  }
}
