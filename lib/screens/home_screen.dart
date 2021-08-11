import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrdemo/providers/qr_provider.dart';
import 'package:qrdemo/providers/routing_provider.dart';
import 'package:qrdemo/providers/timer_provider.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<void> reset(BuildContext context) async {
    Provider.of<TimerProvider>(context, listen: false).setExpire(false);
    Provider.of<TimerProvider>(context, listen: false).reset();
    Provider.of<QRProvider>(context, listen: false).generateCode();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      reset(context);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        leading: Container(),
      ),
      floatingActionButton: SpeedDial(
        child: Icon(Icons.add),
        speedDialChildren: [
          SpeedDialChild(
              child: Icon(Icons.qr_code_scanner),
              label: 'scan',
              backgroundColor: Colors.redAccent,
              onPressed: () async {
                await Provider.of<RoutingProvider>(context, listen: false)
                    .goToScannerScreen(context);
              }),
          SpeedDialChild(
            onPressed: () async {
              Provider.of<TimerProvider>(context, listen: false).reset();
              Provider.of<TimerProvider>(context, listen: false).cancelTimer();
              Provider.of<QRProvider>(context, listen: false).generateCode();
              await Provider.of<RoutingProvider>(context, listen: false)
                  .goToQRScreen(context);
            },
            child: Icon(
              Icons.qr_code,
              color: Colors.black,
            ),
            label: 'generate qr code',
            backgroundColor: Colors.yellowAccent,
          ),
        ],
      ),
    );
  }
}
