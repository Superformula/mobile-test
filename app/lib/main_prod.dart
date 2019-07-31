import 'package:flutter/material.dart';
import 'package:qrgenerator/app/application.dart';
import 'package:qrgenerator/app/init.dart';
import 'package:qrgenerator/core/env/env.dart';

void main() async {
  await initApp(Flavor.production);
  runApp(buildApp());
}
