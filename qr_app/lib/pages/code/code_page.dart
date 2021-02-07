import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/blocs/seed_bloc.dart';
import 'package:qr_app/pages/code/widgets/count_down_display.dart';

class CodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<SeedBloc>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        bloc.cancel();
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('QR Code'),
        ),
        body: Center(
          child: CountDownDisplay(),
        ),
      ),
    );
  }
}
