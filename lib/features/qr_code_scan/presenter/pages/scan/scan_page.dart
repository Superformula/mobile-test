import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:superformula_leandro/core/constants/strings_constants.dart';
import 'package:superformula_leandro/core/widgets/app_error_widget.dart';
import 'package:superformula_leandro/core/widgets/app_primary_button.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/cubits/scan/scan_cubit.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/pages/scan/widgets/scanned_data_body_widget.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final GlobalKey _qrViewKey = GlobalKey(debugLabel: 'qrViewKey');
  late final ScanCubit _scanCubit;

  @override
  void initState() {
    super.initState();
    _scanCubit = context.read<ScanCubit>()..startScan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringsConstants.scan),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: BlocBuilder<ScanCubit, ScanState>(
            bloc: _scanCubit,
            builder: (context, state) {
              return switch (state) {
                ScannedDataState() => ScannedDataBodyWidget(data: state.data),
                ScanErrorState() =>
                  AppErrorWidget(errorMessage: state.errorMessage),
                _ => QRView(
                    key: _qrViewKey,
                    formatsAllowed: const [BarcodeFormat.qrcode],
                    onQRViewCreated: _scanCubit.onQRViewCreated,
                    onPermissionSet: _scanCubit.onPermissionSet,
                  )
              };
            },
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<ScanCubit, ScanState>(
        bloc: _scanCubit,
        builder: (context, state) {
          return switch (state) {
            ScannedDataState() => Padding(
                padding: const EdgeInsets.all(16),
                child: AppPrimaryButton(
                  voidCallback: _scanCubit.startScan,
                  text: StringsConstants.scanAgain,
                ),
              ),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
