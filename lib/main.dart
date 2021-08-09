import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrdemo/providers/firestore_provider.dart';
import 'package:qrdemo/providers/qr_provider.dart';
import 'package:qrdemo/providers/routing_provider.dart';
import 'package:qrdemo/providers/timer_provider.dart';
import 'package:qrdemo/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FirestoreProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => RoutingProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => QRProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => TimerProvider(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'QR Reader Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoWillPopScopePageTransionsBuilder(),
            },
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
