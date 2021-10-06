import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../interactors/gateways/seed_api_gateway.dart';

import '../../interactors/gateways/seed_local_gateway.dart';
import '../interactors/seed_interactor.dart';

import 'app.dart';
import 'interactors/gateways/connectivity.dart';

void main() {
  GetIt.I.registerSingleton<SeedInteractor>(
    SeedInteractor(
      seedLocalGateway: SeedLocalGateway(
        prefs: () => SharedPreferences.getInstance(),
      ),
      seedApiGateway: const SeedApiGateway(),
      canFetch: () => canConnectToApi(Connectivity()),
    ),
  );

  runApp(const App());
}
