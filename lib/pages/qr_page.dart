import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:superformula_test/domain/qr_code/provider/qr_provider.dart';

class QrCodePage extends StatelessWidget {
  QrCodePage({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          title ?? '',
          style: TextStyle(color: Theme.of(context).accentColor),
        )),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Center(
        //The change notfier and consumer widget is this instance updates values that changed in the provider
        child: ChangeNotifierProvider<QRProvider>(
            create: (_) => QRProvider(),
            builder: (context, snapshot) {
              return Consumer<QRProvider>(
                  builder: (context, provider, snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    provider.isLoading
                        ? SizedBox.shrink()
                        : QrImage(
                            data: provider.decodedString ?? '',
                            version: QrVersions.auto,
                            size: 250,
                            gapless: true,
                            foregroundColor: Theme.of(context).primaryColor,
                          ),
                    SizedBox(height: 20),
                    Text(
                      //Logic to determine what text is shown
                      provider.isLoading
                        ? 'Loading'
                        : provider.countdown == 0
                            ? 'Timer Expired'
                            : provider.countdown.toString() + 's')
                  ],
                );
              });
            }),
      ),
    );
  }
}
