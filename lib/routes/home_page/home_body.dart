import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_test/blocs/qrfetch/qrfetch.dart';
import 'package:qr_code_test/configs/routes.dart';
import 'package:qr_code_test/routes/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_test/routes/home_page/icon_and_text.dart';

/// Contains the body of the [HomePage] route, which is only 2 buttons at the
/// center of the screen:
///
///  - The first button opens a new route which fetches a QR code from a server
///  - The second button opens a new route that
class HomeBody extends StatelessWidget {
  const HomeBody();

  /// Opens a new route ([RouteGenerator.fetchQR]) and pushes a new event to the
  /// [QRFetchBloc] to retrieve the data
  void _fetchQR(BuildContext context) {
    // Emit the event
    context.read<QRFetchBloc>().add(const FetchNewQR());

    // Go to the other page
    Navigator.of(context).pushNamed(RouteGenerator.fetchQR);
  }

  /// Opens a new route ([RouteGenerator.scanQR]) to scan a QR code with the
  /// camera
  void _scanQR(BuildContext context) {
    // Go to the other page
    Navigator.of(context).pushNamed(RouteGenerator.scanQR);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Button needed to fetch a QR code
          RaisedButton(
            child: const IconAndText(
              icon: Icon(Icons.cloud_download,
                color: Colors.white,
              ),
              text: "Fetch QR",
            ),
            onPressed: () => _fetchQR(context),
          ),

          const SizedBox(
            height: 35,
          ),

          // Button needed to scan a QR code
          RaisedButton(
            child: const IconAndText(
              icon: Icon(Icons.qr_code_scanner,
                color: Colors.white,
              ),
              text: "Scan QR",
            ),
            onPressed: () => _scanQR(context),
          ),
        ],
      ),
    );
  }
}