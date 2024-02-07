import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:superformula_leandro/core/constants/strings_constants.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/cubits/scan/scan_cubit.dart';

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
                ScannedDataState() => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(StringsConstants.scannedData),
                      const SizedBox(height: 24),
                      Text(state.data),
                    ],
                  ),
                _ => QRView(
                    key: _qrViewKey,
                    formatsAllowed: const [BarcodeFormat.qrcode],
                    onQRViewCreated: _scanCubit.onQRViewCreated,
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
                child: ElevatedButton(
                  onPressed: () {
                    _scanCubit.startScan();
                  },
                  child: const Text(StringsConstants.scanAgain),
                ),
              ),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
