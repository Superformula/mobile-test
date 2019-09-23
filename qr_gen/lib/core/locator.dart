import 'package:get_it/get_it.dart';
import 'package:qr_gen/core/qr.dart';
import 'package:qr_gen/core/services/qr.dart';

import 'package:qr_gen/core/services/scan.dart';

final sl = GetIt.instance;

setupLocator() {
  sl.registerSingleton<ScanService>(ScanServiceImplementation());
  sl.registerSingleton<QrService>(QrServiceImplementation());
  sl.registerSingleton(QrState());
  sl.registerSingleton(QrActions());
}
