import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/blocs/seed_bloc.dart';
import 'widgets/count_down_display.dart';
import 'widgets/qr_code.dart';

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
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              QRCode(),
              SizedBox(
                height: 20,
              ),
              CountDownDisplay(),
            ],
          ),
        ),
      ),
    );
  }
}
