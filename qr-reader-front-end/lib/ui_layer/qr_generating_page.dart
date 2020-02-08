import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:superformula/bloc/bloc_provider.dart';
import 'package:superformula/bloc/qr_bloc.dart';
import 'package:superformula/data_layer/network_seed_repository.dart';
import 'package:superformula/data_layer/qr_seed.dart';

class QrGeneratingPage extends StatelessWidget {
  static const route = '/generating';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QRBloc>(
      bloc: QRBloc(NetworkSeedRepository()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('QR Code'),
        ),
        body: Builder(builder: (context) => _buildQRCodeDisplay(context)),
      ),
    );
  }

  Widget _buildQRCodeDisplay(BuildContext context) {
    final bloc = BlocProvider.of<QRBloc>(context);

    return StreamBuilder<QrSeed>(
      stream: bloc.qrStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          bloc.startRequestingCodes();
          return _buildLoadingIndicator(context);
        }

        final qrCode = snapshot.data;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildQRDisplay(qrCode),
            _buildTimer(bloc),
          ],
        );
      },
    );
  }

  Widget _buildLoadingIndicator(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Theme.of(context).platform == TargetPlatform.iOS
              ? CupertinoActivityIndicator()
              : SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(),
                ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Loading',
              style: Theme.of(context).textTheme.headline,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQRDisplay(QrSeed qrCode) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0),
      child: Container(
        color: Colors.white,
        child: QrImage(
          data: qrCode.seed,
          version: QrVersions.auto,
        ),
      ),
    );
  }

  Widget _buildTimer(QRBloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.expiryStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }

        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            snapshot.data,
            style: Theme.of(context).textTheme.title,
          ),
        );
      },
    );
  }
}
