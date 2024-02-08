import 'package:flutter/material.dart';
import 'package:superformula_leandro/core/injections/inject.dart';
import 'package:superformula_leandro/core/injections/instances/get_it_instance.dart';
import 'package:superformula_leandro/core/widgets/app.dart';

void main() {
  Inject.init(getIt);
  runApp(const App());
}
