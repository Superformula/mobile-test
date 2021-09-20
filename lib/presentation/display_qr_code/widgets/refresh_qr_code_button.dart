import 'package:flutter/material.dart';
import 'package:superformula_mobile_test/application/display_qr_code/display_qr_code_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefreshQrCodeButton extends StatelessWidget {
  const RefreshQrCodeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context
            .read<DisplayQrCodeBloc>()
            .add(const DisplayQrCodeEvent.requestedNewQrCode());
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
      ),
      child: const Icon(
        Icons.refresh,
        size: 50,
      ),
    );
  }
}
