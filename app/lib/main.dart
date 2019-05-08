import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:supercode/containers.dart';
import 'package:supercode/redux/app_state.dart';
import 'package:supercode/redux/middleware.dart';
import 'package:supercode/redux/reducers.dart';
import 'package:supercode/services/seed_service.dart';

void main() => runApp(SupercodeApp());

class SupercodeApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: createMiddleware(
      service: SeedService(
        host: 'http://localhost:3000',
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          accentColor: Colors.deepPurpleAccent,
        ),
        home: ActiveQRSeed(),
      ),
    );
  }
}
