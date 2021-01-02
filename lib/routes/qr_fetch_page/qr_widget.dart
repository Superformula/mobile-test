import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_test/blocs/countdown/countdown.dart';
import 'package:qr_code_test/blocs/qrfetch/qrfetch.dart';
import 'package:qr_code_test/routes/qr_fetch_page/countdown_time.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// Shows the QR code at the center of the screen and the expiry time at the
/// bottom
class QRDisplay extends StatelessWidget {
  /// The [Seed] object retrieved from the internet
  final Seed seedData;
  /// Requires a [Seed] object to generate a QR code
  const QRDisplay(this.seedData);

  /// Returns the size of the QR code box according with the [constraints] passed
  /// by a [LayoutBuilder] widget.
  ///
  /// The default value is `150` but the 'breakpoint' is set at `160` to keep
  /// some margin from the borders.
  double _calculateSize(BoxConstraints constraints) {
    // The default size
    var qrSize = 150.0;

    // Handling the case where there isn't enough horizontal space
    if (constraints.maxWidth <= 160) {
      qrSize = constraints.maxWidth / 1.7;
    }

    // Handling the case where there isn't enough vertical space
    if (constraints.maxHeight < 160) {
      qrSize = constraints.maxHeight / 1.7;
    }

    return qrSize;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // This is required in order to make sure that the size of the QR
            // box doesn't cause overflow errors
            LayoutBuilder(
              builder: (context, sizes) {
                final qrSize = _calculateSize(sizes);

                // The QR code generated from the seed fetched via HTTP
                return QrImage(
                  data: seedData.seed,
                  version: QrVersions.auto,
                  size: qrSize,
                );
              },
            ),

            // Separator
            const SizedBox(
              height: 25,
            ),

            // Shows a countdown timer. When it arrives at zero, the QR code is
            // refreshed with a new one.
            BlocListener<CountdownBloc, CountdownState>(
              listener: (context, state) {
                if (state is CountdownCompleted) {
                  // Refresh the code
                  context.read<QRFetchBloc>().add(const FetchNewQR());
                }
              },
              child: const CountdownTime(),
            ),
          ],
        ),
      ),
    );
  }
}