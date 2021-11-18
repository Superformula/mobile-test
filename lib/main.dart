import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:qr_test/model/timer_provider.dart';
import 'view/home_page.dart';

void main() async {
//Load environment file from root of project file
  await dotenv.load(fileName: ".env");

  runApp(ChangeNotifierProvider(
      create: (context) => TimerProvider(countDown: 0), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
