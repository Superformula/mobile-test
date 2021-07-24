import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrtestcodeone/domain/entity/qr_seed.dart';
import 'package:qrtestcodeone/feature/home/bloc/home_bloc.dart';

///
/// Created by Pablo Reyes [devpab@gmail.com] on 7/20/21.
///

class HomeQrCode extends StatefulWidget {
  final QrSeed qrSeed;

  const HomeQrCode({Key? key, required this.qrSeed}) : super(key: key);

  @override
  _HomeQrCodeState createState() => _HomeQrCodeState();
}

class _HomeQrCodeState extends State<HomeQrCode> {
  CountdownTimerController? _countdownTimerController;

  @override
  void initState() {
    super.initState();
    int endTime = widget.qrSeed.expiresAt.toLocal().millisecondsSinceEpoch;
    _countdownTimerController = CountdownTimerController(
      endTime: endTime,
      onEnd: () => context.read<HomeBloc>().add(HomeEvent.generateQrCode()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CountdownTimer(
            controller: _countdownTimerController,
            widgetBuilder: (_, CurrentRemainingTime? time) {
              if (time == null) {
                return Text(
                  'QR Code has Expired!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                );
              }
              return Text(
                'Expires in: ${time.hours ?? '00'}:${time.min ?? '00'}:${time.sec}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              );
            },
          ),
          const SizedBox(height: 10),
          QrImage(
            data: widget.qrSeed.seed,
            version: QrVersions.auto,
            size: MediaQuery.of(context).size.height / 3,
          ),
          const SizedBox(height: 20),
          Text(
            'QR Code: ${widget.qrSeed.seed}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _countdownTimerController?.dispose();
    super.dispose();
  }
}
