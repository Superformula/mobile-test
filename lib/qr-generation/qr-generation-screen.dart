import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator/models/qr-response-models.dart';
import 'package:qr_generator/providers/bloc-provider.dart';
import 'package:qr_generator/qr-generation/qr-generation-bloc.dart';

class QRGenerationScreen extends StatefulWidget {
  const QRGenerationScreen({ Key? key }) : super(key: key);

  @override
  _QRGenerationScreenState createState() => _QRGenerationScreenState();
}

class _QRGenerationScreenState extends State<QRGenerationScreen> {

  late QRGenerationBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.maybeOf<QRGenerationBloc>(context);
    bloc.subscribeToGeneratedCode();
  }

  Widget _buildScannableQRCode(String qrData) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 40),
          child: QrImage(
            data: qrData,
            size: MediaQuery.of(context).size.height / 4,
          ),
        ),
      ),
    );
  }

  Widget _buildExpirationTimer() {
    return Expanded(
      child: StreamBuilder<int>(
        stream: bloc.qrExpirationTimerStream,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return Text("Code expiring in " + snapshot.data.toString() + "s");
          } else if(snapshot.hasError) {
            return Text(snapshot.error as String);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Unable to load a valid QR code, please try again.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: ElevatedButton(
              child: Text("Try again"),
              onPressed: bloc.subscribeToGeneratedCode,
            ),
          )
        ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share your code"),
      ),
      body: StreamBuilder<QRSeed?>(
        stream: bloc.qrDataStream,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return Column(
              children: [
                _buildScannableQRCode(snapshot.data!.seed),
                _buildExpirationTimer()
              ],
            );
          } else if(snapshot.hasError) {
            return _buildErrorWidget();
          } else {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
              ),
            );
          }
        }
      ),
    );
  }
}