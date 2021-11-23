import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator/general/helpers/constants.dart';
import 'package:qr_generator/general/helpers/format_utils.dart';
import 'package:qr_generator/providers/general.dart';
import 'package:qr_generator/screens/qr_screen/qr_view_model.dart';
import 'package:qr_generator/widgets/primary_button.dart';

class QrScreen extends StatefulWidget {
  QrScreen({Key? key}) : super(key: key);

  @override
  _QrScreenState createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  late Timer _timer;
  int _remainingTime = Constants.resetQRInterval;
  bool _canResetQR = false;
  QrViewModel? _qrViewModel;

  @override
  void initState() {
    super.initState();

    _qrViewModel = Provider.of<QrViewModel>(context, listen: false);
    _getData();
    restartTimer();
  }

  _getData() async {
    General general = Provider.of<General>(context, listen: false);
    await _qrViewModel?.getSeed(general);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("QR Code"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: QrImage(
                  data: _qrViewModel?.seedResponse?.id ?? "",
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                '${FormatUtils.formatRemainingMinutes(_remainingTime)}',
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PrimaryButton(
                    title: "Reset QR",
                    onPressed: _canResetQR ? () => {_onSendAgain()} : null),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void restartTimer() {
    _remainingTime = Constants.resetQRInterval;
    _canResetQR = false;
    startTimer();
  }

  void startTimer() {
    const timeUnit = Duration(seconds: 1);
    _timer = Timer.periodic(
      timeUnit,
      (Timer timer) => setState(
        () {
          if (_remainingTime == 1) {
            _canResetQR = true;
            _remainingTime--;
          }
          if (_remainingTime == 0) {
            timer.cancel();
          } else {
            _remainingTime--;
            _canResetQR = false;
          }
        },
      ),
    );
  }

  _onSendAgain() async {
    restartTimer();
    _getData();
  }
}
