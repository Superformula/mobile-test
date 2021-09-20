import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:superformula_mobile_test/application/display_qr_code/display_qr_code_bloc.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/value_objects/qr_seed_expiration_date.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superformula_mobile_test/presentation/core/misc/colors.dart';

class QRCodeExpirationDateTimer extends StatefulWidget {
  final QrSeedExpirationDate expirationDate;
  const QRCodeExpirationDateTimer({
    required this.expirationDate,
    Key? key,
  }) : super(key: key);

  @override
  State<QRCodeExpirationDateTimer> createState() =>
      _QRCodeExpirationDateTimerState();
}

class _QRCodeExpirationDateTimerState extends State<QRCodeExpirationDateTimer> {
  late int _start;
  late Timer _timer;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        if (_start <= 0) {
          setState(() {
            context
                .read<DisplayQrCodeBloc>()
                .add(const DisplayQrCodeEvent.requestedNewQrCode());
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    _start =
        widget.expirationDate.getOrCrash().difference(DateTime.now()).inSeconds;
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Text(
          'Expires in...\n ${_start.toString()} sec.',
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: superformulaBackgroundColor,
              fontWeight: FontWeight.w900,
              // fontStyle: FontStyle.italic,
              fontFamily: 'Open Sans',
              fontSize: 40),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
