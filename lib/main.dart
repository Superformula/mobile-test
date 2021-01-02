import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_test/blocs/countdown/countdown.dart';
import 'package:qr_code_test/blocs/qrfetch/qrfetch.dart';
import 'package:qr_code_test/blocs/validation/validation.dart';
import 'package:qr_code_test/configs/routes.dart';

void main() {
  // Running the app itself
  runApp(const SuperformulaQR());
}

/// The root widget of the app
class SuperformulaQR extends StatelessWidget {
  const SuperformulaQR();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Fetches a seed from the internet
        BlocProvider<QRFetchBloc>(
          create: (_) => QRFetchBloc(
            repository: const HttpQRRepository()
          ),
        ),

        // Countdown timer that refreshes the QR code
        BlocProvider<CountdownBloc>(
          create: (_) => CountdownBloc(
            counter: const Counter()
          )
        ),

        // Scanned QR validation
        BlocProvider<ValidationBloc>(
          create: (_) => ValidationBloc(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: RouteGenerator.homePage,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          buttonTheme: const ButtonThemeData(
            buttonColor: Colors.blueAccent,
            textTheme: ButtonTextTheme.primary
          )
        ),
      ),
    );
  }
}
