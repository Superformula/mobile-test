import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:qr_generator/injection.config.dart';

final GetIt locator = GetIt.instance;

@injectableInit
Future configureInjection() => $initGetIt(locator);
