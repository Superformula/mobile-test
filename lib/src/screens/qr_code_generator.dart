import 'package:flutter/material.dart';
import 'package:mobile_test/src/bloc/qr_code_generator_bloc.dart';
import 'package:mobile_test/src/screens/base_screen.dart';
import 'package:mobile_test/src/services/respository.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRCodeScreen extends StatefulWidget {
  GenerateQRCodeScreen({this.qrCodeBloc});
  final QRCodeGeneratorBloc qrCodeBloc;
  @override
  GenerateQRCodeScreenState createState() =>
      GenerateQRCodeScreenState(qrCodeBloc: qrCodeBloc);
}

class GenerateQRCodeScreenState extends State<GenerateQRCodeScreen> {
  GenerateQRCodeScreenState({this.qrCodeBloc});
  QRCodeGeneratorBloc qrCodeBloc;
  @override
  void initState() {
    super.initState();
    qrCodeBloc ??= QRCodeGeneratorBloc(seedRepository: SeedRepository());
  }

  @override
  Widget build(BuildContext context) {
    qrCodeBloc.getGenerateQRCode();
    return BaseScreenScaffold(
        title: 'QRCODE',
        body: Container(
            padding: EdgeInsets.only(top: 100),
            alignment: Alignment.center,
            child: Column(children: [
              StreamBuilder(
                  stream: qrCodeBloc.qrCodeSeed,
                  builder: (context, AsyncSnapshot<QrImage> snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data;
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return Container();
                  }),
              StreamBuilder(
                  stream: qrCodeBloc.qrCodeExpiresAt,
                  builder: (context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return Text('Expires At: ${snapshot.data}');
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: CircularProgressIndicator());
                  }),
            ])));
  }
}
