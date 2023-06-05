import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/scan/cubit/scan_cubit.dart';
import 'package:qr_code/scan/view/view.dart';
import 'package:qr_code_repository/qr_code_repository.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (_) => ScanCubit(
          qrCodeRepository: context.read<QrCodeRepository>(),
        ),
        child: const ScanPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const ScanView();
  }
}
