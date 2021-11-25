import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:qr_test/model/data_seed.dart';
import 'package:qr_test/model/timer_provider.dart';
import 'view/home_page.dart';

void main() async {
//Load environment file from root of project file
  await dotenv.load(fileName: ".env");

  //Initializes Hive
  await Hive.initFlutter();

//Register Seed Adapter so that Type Seed can be saved in Hive
  Hive.registerAdapter(DataSeedAdapter());

//Opens box storing seeds
  await Hive.openBox<DataSeed>("seed");

  runApp(ChangeNotifierProvider(
      create: (context) => TimerProvider(countDown: 60), child: const MyApp()));
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
