import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:qr_code_test/model/seed_model.dart';
import 'package:qr_code_test/model/time_provider.dart';
import 'package:hive/hive.dart';
import 'package:qr_code_test/view/home_page.dart';

void main() async {
  //Load environment file
  await dotenv.load(fileName: ".env");

//Initializes Hive
  await Hive.initFlutter();

//Register Seed Adapter so that Type Seed can be saved in Hive
  Hive.registerAdapter(SeedAdapter());

//Opens box storing seeds
  await Hive.openBox<Seed>("seed");

  //Creates state providers for Time and QrCodes to hold state in the app
  //Runs material app
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TimerProvider(startTime: 0)),
    // ChangeNotifierProvider(create: (context) => QrProvider()),
  ], child: const MyApp()));
}
