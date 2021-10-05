import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../interactors/seed_interactor.dart';

import 'app.dart';

void main() {
  GetIt.I.registerSingleton<SeedInteractor>(const SeedInteractor());

  runApp(const App());
}
