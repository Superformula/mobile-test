import 'package:flutter/material.dart';
import 'package:qrcode_app/data/datasource/seeds_api_datasource.dart';
import 'package:qrcode_app/data/repositories/seeds_repository.dart';
import 'package:qrcode_app/presentation/seed_presenter.dart';

import 'screens/home_screen.dart';
import 'presentation/ticker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(
        presenter: SeedPresenter(Ticker(),
            repository: SeedRepositoryImpl(SeedApiDatasource())),
      ),
    );
  }
}
