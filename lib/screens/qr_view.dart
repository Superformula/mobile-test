import 'dart:async' as async;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:superformula_challenge/blocs/blocs.dart';
import 'package:superformula_challenge/models/models.dart';

class QrView extends StatefulWidget {
  static const route = '/qr_view';

  @override
  State<StatefulWidget> createState() {
    return _QrViewState();
  }
}

class _QrViewState extends State<QrView> {
  async.Timer _expirationTimer;
  String _expirationText;

  @override
  void initState() {
    // Get a QR code
    getNewSeed(context);
    super.initState();
  }

  // Get a new seed from the API
  getNewSeed(BuildContext context) {
    setState(() {
      _expirationText = '';
    });
    context.read<GetSeedBloc>().getSeed();
  }

  // Update the UI to display the time until expiration
  setDisplayedExpiration({
    @required Seed seed,
  }) {
    int secondsUntilExpiration = seed.timeUntilExpiration().inSeconds;
    setState(() {
      _expirationText = 'Expires in ${secondsUntilExpiration}s';
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetSeedBloc, GetSeedState>(
      listener: (context, qrState) {
        if (qrState is SeedLoaded) {
          // Cancel the previous timer if applicable
          _expirationTimer?.cancel();

          setDisplayedExpiration(seed: qrState.seed);

          _expirationTimer =
              async.Timer.periodic(Duration(seconds: 1), (async.Timer timer) {
            // Update time until expiration every second
            int secondsUntilExpiration =
                qrState.seed.timeUntilExpiration().inSeconds;
            if (secondsUntilExpiration > 0) {
              setDisplayedExpiration(seed: qrState.seed);
            } else {
              // When the QR code expires, get a new one
              getNewSeed(context);
            }
          });
        } else if (qrState is SeedError) {
          showDialog(
              context: context,
              child: AlertDialog(
                title: Text('Error'),
                content: Text(qrState.error),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Ok'),
                  ),
                ],
              ));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'QR Code',
          ),
          actions: [
            // Refresh button manually retrieves a new QR code
            IconButton(
              icon: Icon(
                Icons.refresh,
              ),
              onPressed: () => getNewSeed(context),
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: BlocBuilder<GetSeedBloc, GetSeedState>(
              builder: (context, qrState) {
                if (qrState is SeedLoading) {
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).accentColor,
                    ),
                  );
                }
                if (qrState is SeedLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      QrImage(
                        data: qrState.seed.seed,
                        size: 150,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        _expirationText,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  );
                }
                // Default display
                return Text(
                  'An error occurred, please refresh to try again.',
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _expirationTimer?.cancel();
    super.dispose();
  }
}
