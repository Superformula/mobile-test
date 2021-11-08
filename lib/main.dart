import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generator/Router/router.dart';
import 'package:generator/home/homePage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        focusColor: Colors.black,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          subtitle1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          headline4: TextStyle(fontSize: 20.0),
          bodyText1: TextStyle(fontSize: 15.0),
        ),
      ),
      home: MyHomePage(title: 'HOME'),
    );
  }
}



