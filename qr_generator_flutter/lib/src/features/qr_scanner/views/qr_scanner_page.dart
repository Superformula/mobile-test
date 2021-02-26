import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:qr_generator_flutter/src/core/styles/app_colors.dart';
import 'package:qr_generator_flutter/src/core/styles/app_text_styles.dart';
import 'package:qr_generator_flutter/src/features/qr_scanner/logic/qr_scanner_cubit.dart';
import 'package:qr_generator_flutter/src/features/qr_scanner/logic/qr_scanner_state.dart';
import 'package:qr_generator_flutter/src/features/qr_scanner/views/qr_scanner_page_i18n.dart';

///Key for testing
final kScannerBody = UniqueKey();

///Key for testing
final kQrScanButton = UniqueKey();

///QrScannerPage
class QrScannerPage extends HookWidget {
  ///QrScannerPage
  const QrScannerPage();

  ///Router for QrScannerPage
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const QrScannerPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(kQrScan.i18n)),
      body: Center(
        child: _ScannerBody(
          key: kScannerBody,
        ),
      ),
    );
  }
}

class _ScannerBody extends StatelessWidget {
  const _ScannerBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const _DefaultData(),
        const SizedBox(height: 30.0),
        const _ScannedCodeBuilder(),
      ],
    );
  }
}

class _DefaultData extends StatelessWidget {
  const _DefaultData();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RaisedButton(
          key: kQrScanButton,
          color: AppColors.pink,
          onPressed: () {
            context.read<QrScannerCubit>().scanQr();
          },
          child: Text(
            kStartScan.i18n,
            style: AppTextStyle.white,
          ),
        ),
        const SizedBox(height: 30.0),
        Text(
          '${kScanResult.i18n}\n(${kLongPressToCopy.i18n}) : ',
          style: AppTextStyle.white,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _ScannedCodeBuilder extends StatelessWidget {
  const _ScannedCodeBuilder();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrScannerCubit, QrScannerState>(
      builder: (context, state) {
        return state.when(
          initial: () => const _ScannedCode(code: kNoCodeScanned),
          data: (code) => _ScannedCode(code: code),
          error: () => const _ScannedCode(code: kNoCodeScanned),
        );
      },
    );
  }
}

class _ScannedCode extends StatelessWidget {
  const _ScannedCode({Key key, @required this.code}) : super(key: key);

  final String code;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Clipboard.setData(ClipboardData(text: code));
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(kTextCopied.i18n)),
        );
      },
      child: Text(
        '$code',
        style: AppTextStyle.code,
        textAlign: TextAlign.center,
      ),
    );
  }
}
