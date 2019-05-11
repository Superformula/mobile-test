import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:supercode/colors.dart';
import 'package:supercode/redux/app_state.dart';
import 'package:supercode/redux/middleware.dart';
import 'package:supercode/redux/reducers.dart';
import 'package:supercode/services/seed_service.dart';

import 'containers/home_container.dart';

GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(SupercodeApp());
}

class SupercodeApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: createMiddleware(
      navigatorKey: _navigatorKey,
      service: SeedServiceImpl(
        host: 'http://192.168.86.46:3000',
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          accentColor: superformulaTeal,
          brightness: Brightness.dark,
        ),
        home: HomeContainer(),
      ),
    );
  }
}
