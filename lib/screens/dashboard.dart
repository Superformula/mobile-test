import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:superformula_challenge/blocs/blocs.dart';
import 'package:superformula_challenge/screens/screens.dart';

class Dashboard extends StatelessWidget {
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return BlocListener<ValidateSeedBloc, ValidateSeedState>(
      listener: (context, validateSeedState) {
        if (validateSeedState is SeedValid) {
          // Show a dialog with the QR code scan result
          showDialog(
            context: context,
            child: AlertDialog(
              title: Text(
                'Secret Word',
              ),
              content: Text(
                validateSeedState.seed,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Ok'),
                )
              ],
            ),
          );
        } else if (validateSeedState is SeedInvalid) {
          // Show a dialog with the QR code scan result
          showDialog(
            context: context,
            child: AlertDialog(
              title: Text(
                'Error',
              ),
              content: Text(
                'QR code has expired.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Ok'),
                )
              ],
            ),
          );
        } else if (validateSeedState is SeedValidationError) {
          // Show a dialog with the QR code scan result
          showDialog(
            context: context,
            child: AlertDialog(
              title: Text(
                'Error',
              ),
              content: Text(validateSeedState.error),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Ok'),
                )
              ],
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: BlocBuilder<ValidateSeedBloc, ValidateSeedState>(
              builder: (context, validateSeedState) {
                if (validateSeedState is ValidatingSeed) {
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).accentColor,
                    ),
                  );
                }
                return Text(
                  'Select an option from the bottom right to scan or generate a QR code.',
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
        ),
        floatingActionButton: SpeedDial(
          children: [
            SpeedDialChild(
              label: 'QR Code',
              child: Icon(
                Icons.qr_code,
                color: Colors.white,
              ),
              onTap: () => Navigator.pushNamed(context, QrView.route),
            ),
            SpeedDialChild(
              label: 'Scan',
              child: Icon(
                Icons.photo_camera,
                color: Colors.white,
              ),
              onTap: () async {
                try {
                  var result = await BarcodeScanner.scan();
                  if (result != null && result.rawContent.isNotEmpty) {
                    context
                        .read<ValidateSeedBloc>()
                        .validateSeed(seed: result.rawContent);
                  }
                } catch (e) {
                  showDialog(
                      context: context,
                      child: AlertDialog(
                        title: Text('Error'),
                        content: Text('An error occurred, please try again.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Ok'),
                          ),
                        ],
                      ));
                }
                //Navigator.pushNamed(context, ScanView.route);
              },
            ),
          ],
          animatedIcon: AnimatedIcons.menu_close,
          animationSpeed: 80,
        ),
      ),
    );
  }
}
