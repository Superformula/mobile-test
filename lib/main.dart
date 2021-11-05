import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sf_qr_code/features/qr/bloc/qr_bloc.dart';
import 'package:sf_qr_code/home/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => QrBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'QR  Code',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.white,
          ),
          home: SplashScreen(),
        ));
  }
}
