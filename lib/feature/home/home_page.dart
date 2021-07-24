import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:qrtestcodeone/app/strings.dart';
import 'package:qrtestcodeone/domain/entity/qr_seed.dart';
import 'package:qrtestcodeone/feature/home/bloc/home_bloc.dart';
import 'package:qrtestcodeone/feature/home/widget/home_qrcode.dart';
import 'package:qrtestcodeone/feature/home/widget/home_qrcode_scanner.dart';
import 'package:qrtestcodeone/widget/circular_progressbar.dart';

///
/// Created by Pablo Reyes [devpab@gmail.com] on 7/20/21.
///
/// Home Page that includes the following features:
/// 1. Generate a new QR
/// 2. Scan QR code
///
/// Note: Use the FAB button to display all available actions
///

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Code')),
      body: _buildBody(),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        children: [
          SpeedDialChild(
            child: Icon(Icons.qr_code),
            label: Strings.kHomeGenerateQrCode,
            onTap: () =>
                context.read<HomeBloc>().add(HomeEvent.generateQrCode()),
          ),
          SpeedDialChild(
            child: Icon(Icons.qr_code_scanner),
            label: Strings.kHomeScanQr,
            onTap: () => context.read<HomeBloc>().add(HomeEvent.scanQrCode()),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        state.maybeWhen(
          onErrorGeneratingQrCode: () {
            final snackBar = const SnackBar(
                content: Text('Error while trying to generate the QR Code'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          orElse: () {/* nop */},
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          onLoading: () => const CircularProgressBar(),
          onQrSeedReady: (QrSeed qrSeed) => HomeQrCode(qrSeed: qrSeed),
          onQrScanRequested: () => HomeQrCodeScanner(),
          onQrCodeScanned: (String qrCode) {
            return Center(
              child: Text(
                'Scanned Code: $qrCode',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            );
          },
          orElse: () {
            return const Center(
              child: Text(
                Strings.kHomePressFabButton,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            );
          },
        );
      },
    );
  }
}
