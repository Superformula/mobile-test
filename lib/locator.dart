import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'locator.config.dart';

final locator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies(String env) async {
  await $initGetIt(locator, environment: env);
}
