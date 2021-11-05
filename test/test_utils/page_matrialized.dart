import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sf_qr_code/features/qr/bloc/qr_bloc.dart';

class PageMaterializer extends StatelessWidget {
  final Widget home;
  final TargetPlatform? platform;
  const PageMaterializer({required this.home, Key? key, this.platform})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => QrBloc()),
        ],
      child: MaterialApp(
          theme: ThemeData(platform: platform), home: Scaffold(body: home)),
    );
  }
}
