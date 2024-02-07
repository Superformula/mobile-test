import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superformula_leandro/core/routes/named_routes.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/cubits/scan/scan_cubit.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/cubits/timer/timer_cubit.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/pages/home/home_page.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/pages/qr_code/qr_code_page.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/pages/scan/scan_page.dart';

sealed class Routes {
  static Map<String, Widget Function(BuildContext)> allRoutes(
    BuildContext context,
  ) =>
      {
        NamedRoutes.home: (context) => const HomePage(),
        NamedRoutes.qrCode: (context) => BlocProvider<TimerCubit>(
              create: (context) => TimerCubit(),
              child: const QrCodePage(),
            ),
        NamedRoutes.scan: (context) => BlocProvider<ScanCubit>(
              create: (context) => ScanCubit(),
              child: const ScanPage(),
            ),
      };
}
