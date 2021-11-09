import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrapp/services/qrservice.dart';
import 'package:qrapp/ui/pages/home_page.dart';
import 'package:qrapp/ui/pages/qrgen_page.dart';
import 'package:qrapp/ui/pages/qrscanner_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const QRApp());
}

class QRApp extends StatelessWidget {
  const QRApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: QRService()),
      ],
      child: MaterialApp(
        title: 'Superformula QR',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/home': (context) => const HomePage(),
          '/qrscanner': (context) => const QRScannerPage(),
          '/qrgen': (context) => const QRGenPage(),
        },
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
