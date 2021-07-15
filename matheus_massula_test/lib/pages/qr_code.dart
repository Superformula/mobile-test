import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matheus_massula_test/cubit/qr_code/cubit/qr_code_cubit.dart';
import 'package:matheus_massula_test/resources/string_constant.dart';

import 'widgets/seconds_count_down.dart';

class QRCodeContainer extends StatelessWidget {
  const QRCodeContainer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        final cubit = QrCodeCubit();
        cubit.getQRCode();
        return cubit;
      },
      child: _QRCodePage(),
    );
  }
}

class _QRCodePage extends StatelessWidget {
  const _QRCodePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstant.QR_CODE_PAGE_TITLE),
        centerTitle: true,
      ),
      body: Column(
        children: [
          BlocConsumer<QrCodeCubit, QrCodeState>(
            listener: (context, state) {
              if(state is QrCodeError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message))
                );
              }
            },
            builder: (context, state) {
              if(state is QrCodeLoaded) {
                return Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Placeholder(color: Colors.green),
                );
              } else if(state is QrCodeError) {
                return Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Placeholder(color: Colors.red),
                );
              } else {
                return Container(
                  height: 400,
                  width: 400,
                  child: Center(
                    child: CircularProgressIndicator()
                  )
                );
              }
            },
          ),
          SecondsCountDown(
            seconds: 15,
            onEnd: () => print('Time is over.'), //TODO: Should I request a new QR Code?
          )
          //Text(StringConstant.SECONDS_LEFT_LABEL)
        ],
      ),
    );
  }
}