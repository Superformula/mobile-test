import 'package:flutter/material.dart';
import 'package:qr_app/data/models/qr_model.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/data/services/qr_service.dart';
import 'package:qr_app/qr/qr_timer.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatefulWidget {
  final String title;

  const QrScreen({Key key, this.title}) : super(key: key);

  @override
  _QrScreenState createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  Future<QrModel> qrModelFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    qrModelFuture = QrService().fetchQrData();
  }

  @override
  Widget build(BuildContext context) {
    QrModel qrModel = Provider.of<QrModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: qrModelFuture,
          builder: (context, AsyncSnapshot<QrModel> asyncsnapshot) {
            if (asyncsnapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!asyncsnapshot.hasData && !asyncsnapshot.hasError) {
              return Container();
            }
            if (asyncsnapshot.hasError) {
              return Container(
                child: Center(
                  child: Text(asyncsnapshot.error.toString()),
                ),
              );
            }
            qrModel = asyncsnapshot.data;

            return Container(
                child: Column(
              children: [
                Expanded(
                    flex: 4,
                    child: Center(
                        child: QrImage(
                      data: qrModel.seed,
                      version: QrVersions.auto,
                      size: 320,
                      gapless: false,
                    ))),
                Expanded(
                    flex: 1,
                    child: FittedBox(
                        fit: BoxFit.contain,
                        child: QrTimer(
                          duration:
                              qrModel.expiresAt.difference(DateTime.now()),
                        )))
              ],
            ));
          }),
    );
  }
}
