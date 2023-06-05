import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/qr_code/cubit/qr_code_cubit.dart';
import 'package:qr_code/qr_code/view/qr_code_view.dart';
import 'package:qr_code_repository/qr_code_repository.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (_) => QrCodeCubit(
          qrCodeRepository: context.read<QrCodeRepository>(),
        ),
        child: const QrCodeView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const QrCodeView();
  }
}
