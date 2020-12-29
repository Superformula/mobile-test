import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_test_app/qr_cubit/qr_cubit.dart';
import 'package:mobile_test_app/repository/qr_repository.dart';
import 'package:mobile_test_app/widget/expiration_countdown.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRPage extends StatefulWidget {
  @override
  _QRPageState createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  QrCubit qrCubit;

  @override
  void initState() {
    qrCubit = QrCubit(repository: GetIt.I<QrRepository>());
    qrCubit.generateQrCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<QrCubit, QrState>(
        cubit: qrCubit,
        builder: (context, state) {
          if (state is QrGenerated) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  QrImage(
                    data: state.qrCode.code,
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                  ExpirationCountdown(
                    expiresAt: state.qrCode.expiresAt,
                  ),
                  Switch(
                    value: state.autoGenerate,
                    onChanged: qrCubit.setAutoRefresh,
                  ), 
                  Text('Auto refresh')
                ],
              ),
            );
          } else if (state is QrLoading) {
            return Center(
              child: Container(
                alignment: Alignment.center,
                height: 200,
                width: 200,
                child: Text('Loading...'),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
