import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrGenerator/app/resources/qr_styles.dart';
import 'package:qrGenerator/app/view_models/qrcode_view_model.dart';
import 'package:qrGenerator/domain/models/seed.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePage extends StatefulWidget {
  @override
  _QRCodePageState createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  bool _hasInitializedSeed;

  @override
  void initState() {
    _hasInitializedSeed = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QrCodeViewModel>(
      create: (context) => QrCodeViewModel(),
      child: Consumer<QrCodeViewModel>(builder: (context, model, child) {

        // Initialize seed on initial build of this widget when this page is
        // launched. Subsequently, new seeds will be fetched on refreshes.
        if (!_hasInitializedSeed) {
          _getSeed(context);
          _hasInitializedSeed = true;
        }

        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                centerTitle: true,
                title: Text('QRCode', style: TextStyle(color: Colors.black45))
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(bottom: 24),
                        child: _showQRCode(model)),
                    Text('Seed : ${_showSeed(model.getSeed())}', style: QrStyles.dataDisplay),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: _showCountdown(context, model),
                    )
                  ],
                ),
              ),
            ));
      }),
    );
  }

  // Generate a seed
  _getSeed(BuildContext context) {
    Provider.of<QrCodeViewModel>(context, listen: false).fetchSeed();
  }

  Widget _showQRCode(QrCodeViewModel model) {
    var val = model.getSeed()?.seed;
    var seedExpired = model.getSeedExpiredState();
    if (val != null) {
      // Embed the 'expired' code into expired QR Images
      return QrImage(data: (seedExpired)? 'expired' : val, version: QrVersions.auto, size: 200.0);
    }
    return Container();
  }

  String _showSeed(Seed seed) {
    var val = seed?.seed ?? '--';
    return val;
  }

  // Show a countdown timer to reflect the seed's expiration time. Expiration times are set
  // in the server. See 'qr_code_gen.dart'.
  _showCountdown(BuildContext context, QrCodeViewModel model) {
    var seed = model.getSeed();
    var seedHasExpired = model.getSeedExpiredState();

    if (seedHasExpired) {
      return Column(
        children: [
          Text('Expired', style: QrStyles.errorDisplay),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: RaisedButton(
              onPressed: () {
                _getSeed(context);
                model.setSeedExpiredState(false);
              },
              color: Colors.red[500],
              child: Text('Refresh seed', style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      );
    }
    if (seed?.expiresAt != null) {
      return CountdownFormatted(
        duration: seed.expiresAt.difference(DateTime.now()),
        builder: (BuildContext context, String str) {
          return Text('Expires in : $str secs', style: QrStyles.dataDisplay);
        },
        onFinish: () {
          model.setSeedExpiredState(true);
        },
      );
    }
    return Text('Expires in : --', style: QrStyles.dataDisplay);
  }
}
